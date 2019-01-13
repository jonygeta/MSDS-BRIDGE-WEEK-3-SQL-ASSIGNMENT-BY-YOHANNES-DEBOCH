-- create user table user

CREATE TABLE `user` (
  `iduser` INT NOT NULL  AUTO_INCREMENT,
  `username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `iduser_UNIQUE` (`iduser` ASC));

-- insert data into user table
INSERT INTO `user` (`iduser`, `username`) VALUES ('1', ' Modesto');
INSERT INTO `user` (`iduser`, `username`) VALUES ('2', 'Ayine ');
INSERT INTO `user` (`iduser`, `username`) VALUES ('3', 'Christopher ');
INSERT INTO `user` (`iduser`, `username`) VALUES ('4', 'Cheong ');
INSERT INTO `user` (`iduser`, `username`) VALUES ('5', 'Saulat ');
INSERT INTO `user` (`iduser`, `username`) VALUES ('6', 'Heidy ');

-- crate user group table
CREATE TABLE `grouptbl` (
  `idgroup` INT NULL,
  `groupname` VARCHAR(100) NOT NULL);

INSERT INTO `grouptbl` (`idgroup`, `groupname`) VALUES ('1', 'I.T.');
INSERT INTO `grouptbl` (`idgroup`, `groupname`) VALUES ('2', 'I.T.');
INSERT INTO `grouptbl` (`idgroup`, `groupname`) VALUES ('3', 'Sales');
INSERT INTO `grouptbl` (`idgroup`, `groupname`) VALUES ('4', 'Sales');
INSERT INTO `grouptbl` (`idgroup`, `groupname`) VALUES ('5', 'Administration');
INSERT INTO `grouptbl` (`groupname`) VALUES ('Operations');

-- create room table

CREATE TABLE `room` (
  `room` VARCHAR(100) NOT NULL,
  `usergroup` VARCHAR(45) NULL);
  
INSERT INTO `room` (`room`, `usergroup`) VALUES ('101', 'I.T.');
INSERT INTO `room` (`room`, `usergroup`) VALUES ('102', 'I.T.');
INSERT INTO `room` (`room`, `usergroup`) VALUES ('102', 'Sales');
INSERT INTO `room` (`room`, `usergroup`) VALUES ('Auditorium A', 'Sales');
INSERT INTO `room` (`room`) VALUES ('Auditorium B');

-- • All groups, and the users in each group.
--  A group should appear even if there are no users assigned to the group. 

SELECT username, groupname FROM user
left JOIN grouptbl
ON grouptbl.idgroup = user.iduser;

-- • All rooms, and the groups assigned to each room. The rooms should
--  appear even if no groups have been assigned to them.
SELECT distinct room, groupname FROM room
left JOIN grouptbl
ON room.usergroup = grouptbl.groupname;

-- • A list of users, the groups that they belong to, and
--  the rooms to which they are assigned. This should be sorted alphabetically
--  by user, then by group, then by room.

select distinct username, groupname, usergroup from user u inner join grouptbl g on
u.iduser = g.idgroup inner join room r on 
g.groupname = r.usergroup;