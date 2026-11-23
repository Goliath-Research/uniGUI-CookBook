-- Replaces the plaintext passwords of an existing MS SQL Users table with the
-- verifier that TUniMainModule.Login and SetPassword compare against:
--   upper-case hex of SHA-256('uniGUI-CookBook:' + lower-case Username + ':' + password)
--
-- Run it once against every MS SQL database the sales applications use
-- (IVC for IVC, OMS for Demo, Sales for Samples/Hybrid3, Hybrid4 and Hybrid5)
-- before deploying the matching build. Rows that already hold a 64 character
-- verifier are left alone, so running it again does nothing.
--
-- Accounts whose username or password contains non-ASCII characters must be
-- given a new password from Edit Users afterwards.

ALTER TABLE Users ALTER COLUMN Password VARCHAR(64) NOT NULL;
GO

UPDATE Users
SET Password = CONVERT(VARCHAR(64),
                       HASHBYTES('SHA2_256',
                                 CAST('uniGUI-CookBook:' + LOWER(Username) + ':' + Password AS VARCHAR(128))),
                       2)
WHERE LEN(Password) < 64;
GO
