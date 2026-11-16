-- Sample data for the Task Manager (Week 6). Run after schema.sql.

TRUNCATE task_tags,tasks,tags,projects,users RESTART IDENTITY CASCADE;
INSERT INTO users (name,email) VALUES
    ('Talha Ahmad',     'talha@example.com'),
    ('Bilal Hussain',   'bilal@example.com'),
    ('Fatima Zahra',    'fatima@example.com'),
    ('Hamza Siddiqui',  'hamza@example.com'),
    ('Zainab Malik',    'zainab@example.com');

INSERT INTO projects (name, owner_id) VALUES
    ('Website Redesign', 1), 
    ('Mobile App',       2),
    ('Marketing Launch', 1),
    ('Internal Wiki',    3);


INSERT INTO tags (name) VALUES
    ('bug'),
    ('feature'),
    ('urgent'),
    ('design'),
    ('backend'),
    ('docs');

INSERT INTO tasks (title, description, status, priority, project_id, assignee_id, due_date) VALUES
    ('Design homepage mockup',        'Wireframes for the new homepage',   'done',        3, 1, 1,    CURRENT_DATE - 20),
    ('Implement navigation bar',      'Responsive top navigation',         'in_progress', 2, 1, 2,    CURRENT_DATE - 3),
    ('Fix broken contact form',       'Form does not send emails',         'todo',        1, 1, 2,    CURRENT_DATE - 7),
    ('Write homepage copy',           'Text for the hero section',         'todo',        3, 1, NULL, CURRENT_DATE + 5),
    ('Set up analytics',              'Add page view tracking',            'done',        4, 1, 2,    CURRENT_DATE - 12),
    ('Build login screen',            'Email and password form',           'in_progress', 2, 2, 2,    CURRENT_DATE + 2),
    ('Integrate push notifications',  'Send alerts to phones',             'todo',        3, 2, 4,    CURRENT_DATE + 14),
    ('Fix crash on startup',          'App closes when opened offline',    'in_progress', 1, 2, 4,    CURRENT_DATE - 1),
    ('Design app icon',               'Icon for both app stores',          'done',        5, 2, 1,    CURRENT_DATE - 30),
    ('Write API documentation',       'Describe every endpoint',           'todo',        4, 2, NULL, NULL),
    ('Plan launch campaign',          'Outline channels and dates',        'done',        2, 3, 3,    CURRENT_DATE - 4),
    ('Prepare press release',         'Announcement for journalists',      'todo',        3, 3, 3,    CURRENT_DATE - 5),
    ('Create social media posts',     'Posts for launch week',             'done',        4, 3, 1,    CURRENT_DATE - 8),
    ('Book launch event venue',       'Find a venue for the event',        'todo',        1, 3, NULL, CURRENT_DATE + 20),
    ('Review launch budget',          'Check spending against plan',       'done',        2, 3, 2,    CURRENT_DATE - 15);

INSERT INTO task_tags (task_id, tag_id) VALUES
    (1, 2), (1, 4),
    (2, 2), (2, 4),
    (3, 1), (3, 3),
    (4, 6),
    (5, 2),
    (6, 2), (6, 5),
    (7, 2), (7, 5),
    (8, 1), (8, 3), (8, 5),
    (9, 4),
    (10, 5), (10, 6),
    (12, 3),
    (14, 2);
    