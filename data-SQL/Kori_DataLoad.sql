-- ============================================
-- DATA LOAD SCRIPT
-- ============================================

-- SUBJECTS (5 insertions)
INSERT INTO subjects (name) VALUES
('Matemática'),
('Português'),
('História'),
('Ciências'),
('Informática');

-- ADMINISTRATORS (5 insertions)
INSERT INTO administrators (username, password_hash) VALUES
('Davi', 	 'PdQf53796'),
('Felipe',   'nAGv51932'),
('Gabriela', 'EnQV84581'),
('Igor',     'bRDa06415'),
('Lucas',    'bkaM61067'),
('MEduarda', 'QjaF29358'),
('Diogo',    'gjLd10397');

-- PROFESSORS (5 insertions)
INSERT INTO professors (username, password_hash, subject_id) VALUES
('ana.mat', 	 '123456', (select id from subjects where name = 'Matemática')),
('carlos.port',  '123456', (select id from subjects where name = 'Português')),
('juliana.hist', '123456', (select id from subjects where name = 'História')),
('marcos.cien',  '123456', (select id from subjects where name = 'Ciências')),
('diogo.info', 	 '123456', (select id from subjects where name = 'Informática'));

-- STUDENTS (10 insertions for variety)
INSERT INTO students (email, password, name, serie) VALUES
('joao.silva@korieducation.com', 		'student123', 	'João Silva', 		1),
('maria.santos@korieducation.com', 	    'student456', 	'Maria Santos', 	4),
('pedro.oliveira@korieducation.com', 	'student789', 	'Pedro Oliveira', 	3),
('ana.costa@korieducation.com', 		'student012', 	'Ana Costa', 		3),
('lucas.ferreira@korieducation.com', 	'student345', 	'Lucas Ferreira', 	1),
('julia.almeida@korieducation.com', 	'student678', 	'Júlia Almeida',    2),
('carlos.rodrigues@korieducation.com',  'student901', 	'Carlos Rodrigues', 5),
('beatriz.lima@korieducation.com', 	    'student234', 	'Beatriz Lima', 	4),
('rafael.martins@korieducation.com', 	'student567', 	'Rafael Martins', 	5),
('gabriela.souza@korieducation.com',	'student890', 	'Gabriela Souza', 	1);

-- GRADES (15 insertions - 3 per subject)
INSERT INTO grades (grade1, grade2, rec, subject_id) VALUES
-- Matemática 
(8.5, 7.0, NULL, (select id from subjects where name = 'Matemática')),
(6.0, 5.5, 7.0,  (select id from subjects where name = 'Matemática')),
(9.0, 8.5, NULL, (select id from subjects where name = 'Matemática')),
-- Português 
(7.5, 8.0, NULL, (select id from subjects where name = 'Português')),
(5.0, 6.0, 6.5,  (select id from subjects where name = 'Português')),
(8.0, 7.5, NULL, (select id from subjects where name = 'Português')),
-- História 
(7.0, 6.5, NULL, (select id from subjects where name = 'História')),
(4.5, 5.0, 6.0,  (select id from subjects where name = 'História')),
(8.5, 9.0, NULL, (select id from subjects where name = 'História')),
-- Ciências 
(6.5, 7.0, NULL, (select id from subjects where name = 'Ciências')),
(5.5, 6.0, 7.5,  (select id from subjects where name = 'Ciências')),
(9.5, 9.0, NULL, (select id from subjects where name = 'Ciências')),
-- Informática 
(8.0, 8.5, NULL, (select id from subjects where name = 'Informática')),
(6.0, 6.5, NULL, (select id from subjects where name = 'Informática')),
(7.5, 7.0, NULL, (select id from subjects where name = 'Informática'));

-- REPORT_CARD (15 insertions - matching grades)
INSERT INTO report_card (final_situation, subject_id, professor_id, student_id) VALUES
-- Student 1 (João Silva)
(TRUE,  (select id from subjects where name = 'Matemática'),   (select id from professors where username = 'ana.mat'), 	    (select enrollment from students where name = 'João Silva')),   
(TRUE,  (select id from subjects where name = 'Português'),    (select id from professors where username = 'carlos.port'),  (select enrollment from students where name = 'João Silva')),   
(TRUE,  (select id from subjects where name = 'História'),     (select id from professors where username = 'juliana.hist'), (select enrollment from students where name = 'João Silva')),   
-- Student 2 (Maria Santos)
(TRUE,  (select id from subjects where name = 'Matemática'),   (select id from professors where username = 'ana.mat'), 	    (select enrollment from students where name = 'Maria Santos')),  
(FALSE, (select id from subjects where name = 'Ciências'),     (select id from professors where username = 'marcos.cien'),  (select enrollment from students where name = 'Maria Santos')),  
-- Student 3 (Pedro Oliveira)
(TRUE,  (select id from subjects where name = 'Português'),    (select id from professors where username = 'carlos.port'),  (select enrollment from students where name = 'Pedro Oliveira')),   
(TRUE,  (select id from subjects where name = 'Informática'),  (select id from professors where username = 'diogo.info'),   (select enrollment from students where name = 'Pedro Oliveira')),   
-- Student 4 (Ana Costa)
(TRUE,  (select id from subjects where name = 'História'),     (select id from professors where username = 'juliana.hist'), (select enrollment from students where name = 'Ana Costa')),   
(TRUE,  (select id from subjects where name = 'Ciências'),     (select id from professors where username = 'marcos.cien'),  (select enrollment from students where name = 'Ana Costa')),   
-- Student 5 (Lucas Ferreira)
(TRUE,  (select id from subjects where name = 'Matemática'),   (select id from professors where username = 'ana.mat'),      (select enrollment from students where name = 'Lucas Ferreira')),   
-- Student 6 (Júlia Almeida)
(TRUE,  (select id from subjects where name = 'Informática'),  (select id from professors where username = 'diogo.info'),   (select enrollment from students where name = 'Júlia Almeida')),   
(TRUE,  (select id from subjects where name = 'Português'),    (select id from professors where username = 'carlos.port'),  (select enrollment from students where name = 'Júlia Almeida')),   
-- Student 7 (Carlos Rodrigues)
(FALSE, (select id from subjects where name = 'História'),     (select id from professors where username = 'juliana.hist'), (select enrollment from students where name = 'Carlos Rodrigues')),  
-- Student 8 (Beatriz Lima)
(TRUE,  (select id from subjects where name = 'Ciências'),     (select id from professors where username = 'marcos.cien'),  (select enrollment from students where name = 'Beatriz Lima')),   
-- Student 9 (Rafael Martins)
(TRUE,  (select id from subjects where name = 'Informática'),  (select id from professors where username = 'diogo.info'),   (select enrollment from students where name = 'Rafael Martins'));

-- GRADE_REP (15 insertions - linking report cards to grades)
INSERT INTO grade_rep (rep_id, grade_id) VALUES
(17, 2),   
(18, 5),   
(19, 8),   
(20, 3),   
(21, 12),  
(22, 6),   
(23, 14),  
(24, 9),   
(25, 11),  
(26, 4),  
(27, 15), 
(28, 7),  
(29, 10),  
(30, 13), 
(31, 16); 

-- OBSERVATIONS (8 insertions)
INSERT INTO observations (observation, student_id) VALUES
('Excelente participação em aula. Mostra fortes habilidades analíticas.',              (select enrollment from students where name = 'João Silva')),
('Precisa melhorar a finalização de lição de casas. Considerar uma tutoria extra.',    (select enrollment from students where name = 'Maria Santos')),
('Estudante muito dedicado. Sempre pontual e engajado.',                               (select enrollment from students where name = 'Pedro Oliveira')),
('Tem problemas com concentração. Recomendo reunião com os pais.',                     (select enrollment from students where name = 'Ana Costa')),
('Performance extraordinária em projetos em grupo',                                    (select enrollment from students where name = 'Lucas Ferreira')),
('Melhoria significante percebida no último semestre. Continue com o bom trabalho!',   (select enrollment from students where name = 'Júlia Almeida')),
('Falta frequentemente. Performance acadêmica está sendo afetada.',                    (select enrollment from students where name = 'Carlos Rodrigues')),
('Grande potencial em pensamentos criaticvos. Incentivar cursos para melhorar.',       (select enrollment from students where name = 'Beatriz Lima'));

