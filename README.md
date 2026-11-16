# week-6
# Task Manager in raw SQL (Week 6)

A task management database built entirely in SQL: five tables, sample data and eight queries. There is no application code.

## Schema
- users: id, name, email (unique, required), created_at
- projects: id, name, owner_id (belongs to one user), created_at
- tasks: id, title, description, status (todo, in_progress or done), priority (1 to 5), project_id, assignee_id (optional), due_date, created_at
- tags: id, name (unique)
- task_tags: task_id and tag_id (composite primary key), the join table between tasks and tags

Deleting a project deletes its tasks. Deleting a user keeps their tasks and clears the assignee.

## Requirements
PostgreSQL 18 (any recent version works) and the `psql` command line tool.

## How to run
Run the three files in this order, against an empty database.

1. Create the database:
   psql -U postgres -c "CREATE DATABASE task_manager;"
2. Create the tables:
   psql -U postgres -d task_manager -f schema.sql
3. Load the sample data:
   psql -U postgres -d task_manager -f seed.sql
4. Run the queries:
   psql -U postgres -d task_manager -f queries.sql

psql asks for the postgres password each time. To start again from scratch, drop the database (DROP DATABASE task_manager;) and repeat from step 1.

## The files
- schema.sql: all five tables, keys and constraints
- seed.sql: 5 users, 4 projects, 15 tasks, 6 tags and 20 task_tags rows, with all three statuses, unassigned tasks and overdue tasks
- queries.sql: the eight required queries, in order, each with its number and purpose

## Constraint checks
These inserts must fail:
- A task with status 'blocked' is rejected by the CHECK on tasks.status.
- A second user with an existing email is rejected by the UNIQUE on users.email.

## Queries
1. Tasks for a project, ordered by due date with NULLs last
2. Task count per status
3. Every user with their number of assigned tasks (zero included)
4. Tasks carrying a given tag
5. Overdue tasks with the assignee's name
6. Top three users by done tasks
7. Projects with no tasks
8. Average number of tags per task