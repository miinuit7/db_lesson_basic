
-- Q1
CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '部署ID',
  name VARCHAR(20) NOT NULL COMMENT '部署名',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
);

-- 上のクエリではcreate_atとupdated_atがNOT NULLではなかったので追記
ALTER TABLE departments
MODIFY created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '作成日時',
MODFIY updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '更新日時';



-- Q2
ALTER TABLE people ADD COLUMN department_id INT UNSIGNED COMMENT 'emailの後ろに追加する' AFTER email;


-- Q3
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
VALUE
('一郎', 'ichiro@gizumo.jp', 1, 24, 1),
('次郎', 'jiro@gizumo.jp', 1, 25, 1),
('三郎', 'saburou@gizumo.jp', 1, 26, 1),
('四郎', 'shirou@gizumo.jp', 2, 27, 1),
('五郎', 'goro@gizumo.jp', 2, 28, 1),
('六郎', 'rokuro@gizumo.jp', 2, 29, 1),
('七郎', 'nanaro@gizumo.jp', 2, 30, 1),
('八郎', 'hachiro@gizumo.jp', 3, 31, 1),
('九郎', 'kuro@gizumo.jp', 4, 32, 1),
('十郎', 'juro@gizumo.jp', 5, 33, 1);

INSERT INTO reports(content, person_id)
VALUE
('テストテストテスト1', 5),
('テストテストテスト2', 6),
('テストテストテスト3', 7),
('テストテストテスト4', 8),
('テストテストテスト5', 9),
('テストテストテスト6', 10),
('テストテストテスト7', 11),
('テストテストテスト8', 14),
('テストテストテスト9', 5),
('テストテストテスト10', 6),
('テストテストテスト11', 7);



-- Q4
UPDATE people SET department_id=1 WHERE person_id=1;
UPDATE people SET department_id=2 WHERE person_id=2;
UPDATE people SET department_id=3 WHERE person_id=4;


-- Q5
SELECT name, age FROM people ORDER BY age DESC;



-- Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

  「people」テーブルの中の「department_id」カラムが1のものだけを指定し、表示させるレコードは「name」「email」「age」。
  さらに「created_at」を基準に昇順で表示させる。

  -- Q7
SELECT name
FROM people
WHERE gender=2 AND age BETWEEN 20 AND 29
OR gender=1 AND age BETWEEN 40 AND 49
ORDER BY gender, age;


-- Q8
SELECT name, age
FROM people
WHERE department_id=1
ORDER BY age DESC;


-- Q9
SELECT AVG(age) AS average_age
FROM people
WHERE gender=2;


-- Q10
SELECT p.name, r.content
FROM people AS p INNER JOIN reports AS r ON p.person_id = r.person_id;


-- Q11
SELECT p.name, r.content
FROM people AS p LEFT OUTER JOIN reports AS r ON p.person_id = r.person_id
WHERE r.content IS NULL;
=======