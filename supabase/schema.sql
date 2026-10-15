create table public.vokalo_user_state (
 user_id uuid primary key references auth.users(id) on delete cascade,
 payload jsonb not null default '{}'::jsonb check (jsonb_typeof(payload) = 'object' and octet_length(payload::text) <= 2097152),
 version bigint not null default 1 check (version > 0),
 updated_at timestamptz not null default now()
);
alter table public.vokalo_user_state enable row level security;
revoke all on public.vokalo_user_state from anon;
grant select, insert, update on public.vokalo_user_state to authenticated;
create policy vokalo_select_own on public.vokalo_user_state for select to authenticated using ((select auth.uid()) = user_id);
create policy vokalo_insert_own on public.vokalo_user_state for insert to authenticated with check ((select auth.uid()) = user_id);
create policy vokalo_update_own on public.vokalo_user_state for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create function public.vokalo_save_state(p_payload jsonb, p_expected_version bigint) returns bigint
language plpgsql security invoker set search_path = '' as $$
declare saved_version bigint;
begin
 if auth.uid() is null then raise exception 'Authentication required' using errcode='42501'; end if;
 if p_expected_version = 0 then
  insert into public.vokalo_user_state(user_id,payload,version) values(auth.uid(),p_payload,1) on conflict(user_id) do nothing returning version into saved_version;
 else
  update public.vokalo_user_state set payload=p_payload,version=version+1,updated_at=now() where user_id=auth.uid() and version=p_expected_version returning version into saved_version;
 end if;
 if saved_version is null then raise exception 'Another device has saved a newer version' using errcode='40001'; end if;
 return saved_version;
end;
$$;
revoke all on function public.vokalo_save_state(jsonb,bigint) from public, anon;
grant execute on function public.vokalo_save_state(jsonb,bigint) to authenticated;