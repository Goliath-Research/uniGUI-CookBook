--
-- File generated with SQLiteStudio v3.1.1 on Wed Oct 4 09:25:11 2017
--
-- Text encoding used: System
--
BEGIN TRANSACTION;

SET IDENTITY_INSERT Customers ON;

-- Table: Customers
INSERT INTO Customers (
                          ID,
                          Name
                      )
                      VALUES (
                          1,
                          'John Doe'
                      );

INSERT INTO Customers (
                          ID,
                          Name
                      )
                      VALUES (
                          2,
                          'Jane Doe'
                      );

INSERT INTO Customers (
                          ID,
                          Name
                      )
                      VALUES (
                          3,
                          'Picky Customer'
                      );

INSERT INTO Customers (
                          ID,
                          Name
                      )
                      VALUES (
                          4,
                          'Compulsive Buyer'
                      );

SET IDENTITY_INSERT Customers OFF;

-- Table: Products

SET IDENTITY_INSERT Products  ON;

INSERT INTO Products (
                         ID,
                         Description,
                         Price
                     )
                     VALUES (
                         1,
                         'Mouse',
                         10
                     );

INSERT INTO Products (
                         ID,
                         Description,
                         Price
                     )
                     VALUES (
                         2,
                         'Keyboard',
                         20
                     );

INSERT INTO Products (
                         ID,
                         Description,
                         Price
                     )
                     VALUES (
                         3,
                         'Monitor',
                         80
                     );

INSERT INTO Products (
                         ID,
                         Description,
                         Price
                     )
                     VALUES (
                         4,
                         'Personal Computer',
                         500
                     );

INSERT INTO Products (
                         ID,
                         Description,
                         Price
                     )
                     VALUES (
                         5,
                         'Smart Phone',
                         200
                     );

INSERT INTO Products (
                         ID,
                         Description,
                         Price
                     )
                     VALUES (
                         6,
                         'Tablet',
                         300
                     );

INSERT INTO Products (
                         ID,
                         Description,
                         Price
                     )
                     VALUES (
                         7,
                         'USB Memory',
                         40
                     );

INSERT INTO Products (
                         ID,
                         Description,
                         Price
                     )
                     VALUES (
                         8,
                         'External SSD Drive',
                         150
                     );

SET IDENTITY_INSERT Products  OFF;

-- Table: Orders

SET IDENTITY_INSERT Orders    ON;

INSERT INTO Orders (
                       ID,
                       CustomerID,
                       Posted,
                       Paid
                   )
                   VALUES (
                       1,
                       2,
                       '2017-07-01 13:30:00.000',
                       NULL
                   );

INSERT INTO Orders (
                       ID,
                       CustomerID,
                       Posted,
                       Paid
                   )
                   VALUES (
                       2,
                       1,
                       '2017-07-01 16:00:00.000',
                       NULL
                   );


SET IDENTITY_INSERT Orders    OFF;


-- Table: Items

INSERT INTO Items (
                      OrderID,
                      ProductID,
                      Quantity
                  )
                  VALUES (
                      2,
                      4,
                      1
                  );

INSERT INTO Items (
                      OrderID,
                      ProductID,
                      Quantity
                  )
                  VALUES (
                      2,
                      3,
                      1
                  );

INSERT INTO Items (
                      OrderID,
                      ProductID,
                      Quantity
                  )
                  VALUES (
                      2,
                      2,
                      1
                  );

INSERT INTO Items (
                      OrderID,
                      ProductID,
                      Quantity
                  )
                  VALUES (
                      2,
                      1,
                      1
                  );

INSERT INTO Items (
                      OrderID,
                      ProductID,
                      Quantity
                  )
                  VALUES (
                      2,
                      8,
                      1
                  );

INSERT INTO Items (
                      OrderID,
                      ProductID,
                      Quantity
                  )
                  VALUES (
                      1,
                      6,
                      1
                  );

INSERT INTO Items (
                      OrderID,
                      ProductID,
                      Quantity
                  )
                  VALUES (
                      1,
                      7,
                      2
                  );


-- Table: Users

INSERT INTO Users (
                      Username,
                      Password,
                      Admin
                  )
                  VALUES (
                      'admin',
                      'password',
                      1
                  );

INSERT INTO Users (
                      Username,
                      Password,
                      Admin
                  )
                  VALUES (
                      'user',
                      'password',
                      0
                  );


COMMIT TRANSACTION;
