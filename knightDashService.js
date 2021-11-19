/**
 * This module implements a REST-inspired webservice for the Monopoly DB.
 * The database is hosted on ElephantSQL.
 *
 * Currently, the service supports the player table only.
 *
 * To guard against SQL injection attacks, this code uses pg-promise's built-in
 * variable escaping. This prevents a client from issuing this URL:
 *     https://cs262-monopoly-service.herokuapp.com/players/1%3BDELETE%20FROM%20PlayerGame%3BDELETE%20FROM%20Player
 * which would delete records in the PlayerGame and then the Player tables.
 * In particular, we don't use JS template strings because it doesn't filter
 * client-supplied values properly.
 *
 * TODO: Consider using Prepared Statements.
 *      https://vitaly-t.github.io/pg-promise/PreparedStatement.html
 *
 * @author: kvlinden
 * @editor: mindysport
 * @date: Summer, 2020
 * @update: Fall, 2021
 */
// Set up the database connection.
const pgp = require('pg-promise')();
const db = pgp({
    host: process.env.DB_SERVER,
    port: process.env.DB_PORT,
    database: process.env.DB_USER,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD
});

// Configure the server and its routes.

const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const router = express.Router();
router.use(express.json());

router.get("/", readHelloMessage);
router.get("/users", readUsers);
router.get("/orders", readActiveOrders);
router.get("/orders/:id", readOrderDetails);
router.get("/drinks", readDrinks);
router.get("/foods", readFoods);
router.get("/users/:id", readUser);
router.put("/users/:id", updateUser);
router.post('/users', createUser);
router.delete('/users/:id', deleteUser);
router.get("/userOrders/:id", readUserOrder);

app.use(router);
app.use(errorHandler);
app.listen(port, () => console.log(`Listening on port ${port}`));

// Implement the CRUD operations.

function errorHandler(err, req, res) {
    if (app.get('env') === "development") {
        console.log(err);
    }
    res.sendStatus(err.status || 500);
}

function returnDataOr404(res, data) {
    if (data == null) {
        res.sendStatus(404);
    } else {
        res.send(data);
    }
}

function readHelloMessage(req, res) {
    res.send('Hello, this is the updated KnightDash data service!');
}

function readUsers(req, res, next) {
    db.many("SELECT * FROM KUser")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

function readActiveOrders(req, res, next) {
    db.many("SELECT * FROM KOrder ko INNER JOIN KUser ku ON ko.userID = ku.ID INNER JOIN DiningHall d on d.ID = ko.diningHallId WHERE status = 'active'")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

function readDrinks(req, res, next) {
    db.many("SELECT * FROM FoodDrinkItem WHERE ItemType = 'drink'")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

function readFoods(req, res, next) {
    db.many("SELECT * FROM FoodDrinkItem WHERE ItemType = 'food'")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

function readUser(req, res, next) {
    db.oneOrNone('SELECT * FROM KUser WHERE id=${id}', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function readOrderDetails(req, res, next) {
    db.oneOrNone('SELECT * FROM KOrder WHERE id=${id}', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function updateUser(req, res, next) {
    db.oneOrNone('UPDATE KUser SET location=${body.location} WHERE id=${params.id} RETURNING id', req)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function createUser(req, res, next) {
    db.one('INSERT INTO Player(email, name) VALUES (${email}, ${name}) RETURNING id', req.body)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        });
}

function deleteUser(req, res, next) {
    db.oneOrNone('DELETE FROM KUser WHERE id=${id} RETURNING id', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function readUserOrder(req, res, next) {
    db.any('SELECT * FROM KUser ku INNER JOIN KOrder ko ON ku.id = ko.userId WHERE ku.id=${id}', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}