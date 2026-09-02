CREATE TABLE branches (
    branch_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(30)
);

INSERT INTO branches (name, address, phone) VALUES
('Alexandria Branch', 'Smouha, Alexandria', '03-4201001'),
('Cairo Branch', 'Nasr City, Cairo', '02-2405002'),
('Giza Branch', 'Dokki, Giza', '02-3337003');