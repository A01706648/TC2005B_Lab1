const projectModel = require('../model/projectModel.js');

exports.get = (request, response, next) =>
{
    console.log(projectModel.getList().length);
    response.render('home', {session:request.session,
                                project_list: projectModel.getList()});
}

