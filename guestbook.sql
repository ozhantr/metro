-- Create syntax for 'guestbook'
DROP TABLE IF EXISTS `guestbook`;

CREATE TABLE `guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0-inactive, 1-active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Create syntax for 'user'
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `authorization` enum('guest','admin') COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0-inactive, 1-active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `guestbook` (`id`, `user_id`, `title`, `note`, `is_active`)
VALUES
	(1,17,'Conquest of Space','Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',0),
	(2,9,'Heroes for Sale','Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.',0),
	(3,6,'Leafie, a Hen Into the Wild Madangeul Naon Amtak','In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.',1),
	(4,13,'To Hell and Back','Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.',0),
	(5,7,'Aventure','Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',0),
	(6,3,'Chicago','Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',0),
	(7,20,'Stolen Collection, Skradziona kolekcja','Ut at dolor quis odio consequat varius.',1),
	(8,18,'BASEketball','Integer a nibh.',0),
	(9,12,'Scarlet and the Black, The','Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',0),
	(10,15,'In the Edges: The \'Grizzly Man\' Session ','Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.',0),
	(11,4,'Marseillaise, La','Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',0),
	(12,5,'Waxworks Das Wachsfigurenkabinett','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',0),
	(13,6,'Christmas Carol: The Musical, A (Christmas Carol, A)','Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.',0),
	(14,19,'Bed of Roses','Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',0),
	(15,14,'Samsara','Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.',0),
	(16,9,'Babar The Movie','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.',0),
	(17,12,'San Quentin','Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.',0),
	(18,19,'Mother and the Whore, The (Maman et la putain, La)','Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',0),
	(19,13,'Last Man Standing','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.',0),
	(20,12,'Farewell to Arms, A','In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.',0),
	(21,15,'Prince & Me, The','Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.',0),
	(22,1,'Fly, The','Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.',0),
	(23,2,'Mosquito Coast, The','Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.',0),
	(24,6,'Dimples','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.',1),
	(25,4,'Bloody Bloody Bible Camp','Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.',0),
	(26,17,'Tyler Perry\'s Why Did I Get Married Too?','In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',0),
	(27,10,'Tracers','Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.',0),
	(28,20,'Suburban Gothic','In congue.',0),
	(29,3,'French Connection II','Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.',0),
	(30,8,'Ffolkes','Duis bibendum. Morbi non quam nec dui luctus rutrum.',0),
	(31,5,'Lusty Men, The','Quisque porta volutpat erat.',0),
	(32,14,'Dreaming of Joseph Lees','Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.',1),
	(33,15,'Penitentiary II','Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',0),
	(34,9,'Border Incident','Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.',0),
	(35,2,'Quartier Mozart','Nunc purus. Phasellus in felis. Donec semper sapien a libero.',0),
	(36,6,'Tokyo Trial Tokyo saiban','Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.',0),
	(37,16,'Hot Coffee','Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.',0),
	(38,5,'Feast of Love','Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.',0),
	(39,5,'The Sign of Four: Sherlock Holmes\' Greatest Case','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',0),
	(40,16,'Grudge 2, The','Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',0);


INSERT INTO `user` (`id`, `email`, `password`, `first_name`, `last_name`, `authorization`, `is_active`)
VALUES
	(1,'ozhantr@hotmail.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Ozhan','Tr','admin',1),
	(2,'hleydon0@opera.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Hersh','Leydon','guest',0),
	(3,'zkeasy1@archive.org','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Zita','Keasy','guest',0),
	(4,'lkall2@imgur.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Leona','Kall','guest',1),
	(5,'wgoranov3@istockphoto.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Wash','Goranov','guest',0),
	(6,'jpedro4@tinyurl.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Jo ann','Pedro','guest',1),
	(7,'cnoni5@craigslist.org','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Chicky','Noni','guest',0),
	(8,'bkohlerman6@sogou.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Berri','Kohlerman','guest',0),
	(9,'hkarpe7@cornell.edu','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Harmon','Karpe','guest',0),
	(10,'gertel8@usnews.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Gaye','Ertel','guest',0),
	(11,'emanssuer9@google.de','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Ebenezer','Manssuer','guest',1),
	(12,'dperrycosta@theguardian.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Dosi','Perrycost','guest',0),
	(13,'lharbererb@psu.edu','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Lynea','Harberer','guest',0),
	(14,'vmorfieldc@usda.gov','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Verge','Morfield','guest',0),
	(15,'hblazynskid@google.com.hk','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Hammad','Blazynski','guest',1),
	(16,'mgrzegorzewicze@vkontakte.ru','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Madeline','Grzegorzewicz','guest',0),
	(17,'kmckibbenf@statcounter.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Kiley','McKibben','guest',0),
	(18,'cblaxillg@etsy.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Carlin','Blaxill','guest',1),
	(19,'ssalsburyh@ft.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Shaughn','Salsbury','guest',0),
	(20,'hklimshuki@reverbnation.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Hildegaard','Klimshuk','guest',0),
	(21,'tlebrumj@nydailynews.com','$2y$10$pF.m0J8ls2slPvTxWtULG.5GdvYsjeW5MPIzCbgACW2yTY5L8ICWe','Theo','Le Brum','guest',0);