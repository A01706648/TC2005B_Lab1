const express = require('express');
const path = require('path');
const router = express.Router();

const task_array = [new TaskObj(1234, 'Task A')
                            , new TaskObj(5678, 'Task B')
                            , new TaskObj(9012, 'Task C')
                            , new TaskObj(3456, 'Task D')];

const user_array = [new UserObj(1234, 'User A')
                            , new UserObj(5678, 'User B')
                            , new UserObj(9012, 'User C')
                            , new UserObj(3456, 'User D')];                            

function TaskObj(id, name)
{
    this.id = id;
    this.name = name;
}

function UserObj(id, name)
{
    this.id = id;
    this.name = name;
}


router.use('/', (request, response, next) => {
    response.render('project', {task_list: task_array,
                                user_list: user_array});
});

module.exports = route;


