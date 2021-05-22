create database Library
go

use Library
go

create table Author
(
    id   int identity
        constraint Author_pk
        primary key nonclustered,
    name varchar(50)
)
    go

create unique index Author_name_uindex
    on Author (name)
go

create table Book
(
    id        int identity
        constraint Book_pk
        primary key nonclustered,
    title     varchar(150),
    author_id int
        constraint Book_Author_id_fk
            references Author
)
    go

create unique index Book_title_uindex
    on Book (title)
go

insert into Author (name)
values ('Лев Толстой'), ('Эвальд Ильенков');
insert into Book (title, author_id)
values ('Война и мир', 1), ('Про идолы и идеалы', 2);
insert into Book (title, author_id)
values ('Анна Каренина', 1)

CREATE PROCEDURE getBooksNumber
    @AuthorId int,
    @BookCount int OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
SELECT @BookCount = count(b.id)
FROM Book b, Author a
WHERE b.author_id = a.id AND a.id = @AuthorId;
END;

DECLARE @RESULT INT
EXEC getBooksNumber 2, @RESULT OUT
SELECT @RESULT
