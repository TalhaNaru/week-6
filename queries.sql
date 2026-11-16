-- queries.sql
-- Task Manager queries (Week 6). Run after schema.sql and seed.sql.

-- Query 4: Change 'bug' to try another tag.
SELECT t.id, t.title, t.status
FROM tasks t
JOIN task_tags tt ON tt.task_id = t.id
JOIN tags tg ON tg.id = tt.tag_id
WHERE tg.name = 'bug'
ORDER BY t.id;

-- Query 5: Overdue tasks (due before today and not done) with the assignee's name.
SELECT t.id, t.title, t.due_date, t.status, u.name AS assignee
FROM tasks t
LEFT JOIN users u ON u.id = t.assignee_id
WHERE t.due_date < CURRENT_DATE
  AND t.status <> 'done'
ORDER BY t.due_date;

-- Query 7: Projects that have no tasks at all.
SELECT p.id, p.name
FROM projects p
LEFT JOIN tasks t ON t.project_id = p.id
WHERE t.id IS NULL;

-- Task Manager queries (Week 6). Run after schema.sql and seed.sql.

-- Query 2: A count of tasks per status.
SELECT status, count(*) AS tasks
FROM tasks
GROUP BY status
ORDER BY status;

-- Query 3: Every user with their number of assigned tasks.
-- LEFT JOIN keeps users with zero tasks; count(t.id) counts only real tasks.
SELECT u.id, u.name, count(t.id) AS assigned_tasks
FROM users u
LEFT JOIN tasks t ON t.assignee_id = u.id
GROUP BY u.id, u.name
ORDER BY u.id;

-- Query 4: All tasks carrying a given tag name, joined through task_tags.
-- Change 'bug' to try another tag.
SELECT t.id, t.title, t.status
FROM tasks t
JOIN task_tags tt ON tt.task_id = t.id
JOIN tags tg ON tg.id = tt.tag_id
WHERE tg.name = 'bug'
ORDER BY t.id;

-- Query 5: Overdue tasks (due before today and not done) with the assignee's name.
SELECT t.id, t.title, t.due_date, t.status, u.name AS assignee
FROM tasks t
LEFT JOIN users u ON u.id = t.assignee_id
WHERE t.due_date < CURRENT_DATE
  AND t.status <> 'done'
ORDER BY t.due_date;

-- Query 6: The top three users by number of done tasks.
-- The done condition is in ON so users with no done tasks are not discarded.
SELECT u.name, count(t.id) AS done_tasks
FROM users u
LEFT JOIN tasks t ON t.assignee_id = u.id AND t.status = 'done'
GROUP BY u.id, u.name
ORDER BY done_tasks DESC, u.name
LIMIT 3;



-- Query 8: The average number of tags per task (tasks with no tags count as 0).
SELECT round(avg(tag_count), 2) AS avg_tags_per_task
FROM (
    SELECT t.id, count(tt.tag_id) AS tag_count
    FROM tasks t
    LEFT JOIN task_tags tt ON tt.task_id = t.id
    GROUP BY t.id
) AS per_task;