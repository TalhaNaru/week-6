-- schema.sql
-- Task Manager schema (Week 6). Run against an empty database.

CREATE TABLE users (
    id         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name       TEXT,
    email      TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE projects (
    id         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name       TEXT NOT NULL,
    owner_id   INTEGER NOT NULL REFERENCES users (id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE tags (
    id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE tasks (
    id          INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title       TEXT NOT NULL,
    description TEXT,
    status      TEXT NOT NULL DEFAULT 'todo'
                CHECK (status IN ('todo', 'in_progress', 'done')),
    priority    INTEGER CHECK (priority BETWEEN 1 AND 5),
    project_id  INTEGER NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    assignee_id INTEGER REFERENCES users (id) ON DELETE SET NULL,
    due_date    DATE,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE task_tags (
    task_id INTEGER NOT NULL REFERENCES tasks (id) ON DELETE CASCADE,
    tag_id  INTEGER NOT NULL REFERENCES tags (id) ON DELETE CASCADE,
    PRIMARY KEY (task_id, tag_id)
);

