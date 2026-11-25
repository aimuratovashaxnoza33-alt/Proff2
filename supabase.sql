-- Supabase → SQL Editor ichiga qo‘yib, Run bosing.
create table chats (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  mode text not null,
  title text not null,
  msgs jsonb not null,
  arch boolean not null default false,
  ts bigint not null
);
alter table chats enable row level security;
create policy "faqat o‘zining suhbatlari" on chats for all
  using (user_id = auth.uid()) with check (user_id = auth.uid());

create table usage (
  id bigserial primary key,
  user_id uuid not null,
  created_at timestamptz not null default now()
);
create index on usage (user_id, created_at);
alter table usage enable row level security; -- siyosat yo‘q: faqat server kaliti yozadi
