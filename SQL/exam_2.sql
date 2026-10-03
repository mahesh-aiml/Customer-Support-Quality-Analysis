create database exam_2;
use exam_2;

create table teams(
team_id varchar(10) primary key ,
team varchar(40),
department varchar(30)
);

INSERT INTO teams (team_id, team, department) VALUES
('T1', 'AccountCare', 'Service'),
('T2', 'BillingHelp', 'Service'),
('T3', 'AppSupport', 'Technical'),
('T4', 'DeviceHelp', 'Technical');


create table tickets(
ticket_id int primary key,
month varchar(20),
team_id varchar(10),
channel varchar(30),
resolution_hours int,
satisfaction int,
foreign key (team_id) references teams(team_id)
);

INSERT INTO tickets(ticket_id, `month`, team_id, channel, resolution_hours, satisfaction) VALUES
(1, 'Jan', 'T1', 'Email', 12, 4),
(2, 'Jan', 'T2', 'Chat', 28, 3),
(3, 'Jan', 'T3', 'Phone', 36, 2),
(4, 'Jan', 'T4', 'Email', 20, 4),
(5, 'Feb', 'T1', 'Chat', 8, 5),
(6, 'Feb', 'T2', 'Phone', 30, 3),
(7, 'Feb', 'T3', 'Email', 18, 4),
(8, 'Feb', 'T4', 'Chat', 40, 2),
(9, 'Mar', 'T1', 'Phone', 16, 4),
(10, 'Mar', 'T2', 'Email', 22, 4),
(11, 'Mar', 'T3', 'Chat', 32, 3),
(12, 'Mar', 'T4', 'Phone', 24, 5);

select * from teams;
select * from tickets;

## Query ##
# S2a
select tm.department , avg(t.resolution_hours)  as avg_resolution_hours
from tickets t
join teams tm 
on t.team_id = tm.team_id
group by tm.department
order by  avg_resolution_hours desc;

# S2b
select ticket_id,avg(resolution_hours) 
from tickets
group by ticket_id
having avg(resolution_hours) < 24;

# S2c
select ticket_id,sum(resolution_hours) 
from tickets 
group by ticket_id
having sum(resolution_hours) > 24
order by sum(resolution_hours ) desc limit 2;




