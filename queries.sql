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