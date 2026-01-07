Q1
create table `departments`(
`department_id` int unsigned NOT NULL PRIMARY KEY,
`name` VARCHAR(20) NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
`updated_at` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
ALTER TABLE departments
MODIFY `updated_at` DATETIME
DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE departments MODIFY `department_id`INT UNSIGNED NOT NULL AUTO_INCREMENT

ALTER TABLE people ADD department_id INT unsigned AFTER email;

ALTER TABLE people MODIFY department_id INT(10) unsigned;

Q3
部署追加
INSERT INTO departments (department_id,name)
values
(1,'営業'),
(2,'開発'),
(3,'経理'),
(4,'人事'),
(5,'情報システム');

人追加
INSERT INTO people (person_id,name,email,department_id,age,gender)
values
(7,'田中 健一','kenichi.tanaka@example.com',1,30,1),
(8,'佐藤 由紀','yuki.sato@example.com',1,28,2),
(9,'鈴木 大輔','daisuke.suzuki@example.com',1,25,1),

(10,'高橋 直子','naoko.takahashi@example.com',2,40,2),
(11,'伊藤 恒一','koichi.ito@example.com',2,35,1),
(12,'渡辺 真理','mari.watanabe@example.com',2,29,2),
(13,'中村 光一','koichi.nakamura@example.com',2,42,1),

(14,'小林 智也','tomoya.kobayashi@example.com',3,50,1),

(15,'加藤 恵','megumi.kato@example.com',4,27,2),

(16,'吉田 裕介','yusuke.yoshida@example.com',5,32,1);

日報追加
INSERT INTO reports (person_id,content)
values
(7,'オムライスを食べました。'),
(8,'ハンバーグを食べました。'),
(9,'カルボナーラを食べました。'),
(10,'ビーフシチューを食べました。'),
(11,'ロールキャベツを食べました。'),
(12,'エビフライを食べました。'),
(13,'チキン南蛮を食べました。'),
(14,'ハヤシライスを食べました。'),
(15,'ロコモコ丼を食べました。'),
(16,'チャーハンを食べました。');

Q4
UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 4 WHERE person_id = 4;
UPDATE people SET department_id = 4 WHERE person_id = 6;

Q5
SELECT 
 name, age
FROM 
 people
WHERE
 gender = 1
ORDER BY
 age DESC;

Q6
peopleテーブルに保存されているレコードの中から
department_idが1のレコードだけを対象にして、
name、email、ageのカラムの値を取得し、
created_atカラムの値の順で並び替えて表示する
という意味のSQL文

Q7
SELECT name 
FROM people
WHERE
 (age BETWEEN 20 AND 29 AND gender = 2)
 OR
 (age BETWEEN 40 AND 39 AND gender = 1);

Q8
SELECT name
FROM
 people
WHERE
 department_id = 1
ORDER BY
 age ASC;

Q9
SELECT
 AVG(age) AS average_age
FROM
 people
WHERE
 department_id = 2
 AND gender = 2;

Q10
SELECT
 p.name AS 名前,
 p.department_id AS 部署ID,
 r.content AS 日報内容
FROM people p
INNER JOIN reports r
  ON p.person_id = r.person_id;

Q11
SELECT p.name
FROM people p
LEFT JOIN reports r
  ON p.person_id = r.person_id
WHERE r.person_id IS NULL;