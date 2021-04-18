const express = require('express');
const path = require('path');
const router = express.Router();

const project_array = [new ProjectObj(1234, 'Project A')
                            , new ProjectObj(5678, 'Project B')
                            , new ProjectObj(9012, 'Project C')
                            , new ProjectObj(3456, 'Project D')];

function ProjectObj(id, name)
{
    this.id = id;
    this.name = name;
}


router.use('/', (request, response, next) => {
    console.log(project_array);
    response.render('home', {project_list: project_array});
});

module.exports = router;


