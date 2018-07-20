-- Schema
CREATE DATABASE outerspace;

CREATE TABLE planets (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100),
  image_url VARCHAR(400)
);

INSERT INTO planets (name, image_url) values ('Mercury', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Mercury_Globe-MESSENGER_mosaic_centered_at_0degN-0degE.jpg/440px-Mercury_Globe-MESSENGER_mosaic_centered_at_0degN-0degE.jpg');
INSERT INTO planets (name, image_url) values ('Venus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Venus_globe.jpg/460px-Venus_globe.jpg');
INSERT INTO planets (name, image_url) values ('Earth', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/The_Earth_seen_from_Apollo_17.jpg/450px-The_Earth_seen_from_Apollo_17.jpg');
INSERT INTO planets (name, image_url) values ('Mars', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/OSIRIS_Mars_true_color.jpg/550px-OSIRIS_Mars_true_color.jpg');
INSERT INTO planets (name, image_url) values ('Jupiter', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg/660px-Jupiter_and_its_shrunken_Great_Red_Spot.jpg');
INSERT INTO planets (name, image_url) values ('Saturn', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Saturn_during_Equinox.jpg/660px-Saturn_during_Equinox.jpg');
INSERT INTO planets (name, image_url) values ('Uranus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Uranus2.jpg/520px-Uranus2.jpg');
INSERT INTO planets (name, image_url) values ('Neptune', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Neptune_Full.jpg/550px-Neptune_Full.jpg');
INSERT INTO planets (name, image_url) values ('Pluto', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Nh-pluto-in-true-color_2x_JPEG-edit-frame.jpg/450px-Nh-pluto-in-true-color_2x_JPEG-edit-frame.jpg');
