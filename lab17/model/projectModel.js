

class ProjectClass
{
    static project_list = [];

    constructor(id
                , name
                , description
                , state)
    {
        this.id = id;
        this.name = name;
        this.description = description;
        this.creatDate = Date.now();
        this.state = state;
    }

    static create(id
                    , name
                    , description 
                    , state)
    {
        let project = new ProjectClass(id
                                    , name
                                    , description
                                    , state);
        this.project_list.push(project);

        return project;
    }

    static modify(id
                , name
                , description
                , state)
    {
        let index = this.getIndexById(id);
        let project = null;


        if(index != -1)
        {
            this.project_list[index].name = name;
            this.project_list[index].description = description;
            this.project_list[index].state = state;
            
            project = this.project_list[index];

            console.log(this.project_list[index].description);
        }
        else
        {
            console.log("Project No Found");
        }
        return project;
    }

    static getEmpty()
    {
        return    new ProjectClass(0
                                , ''
                                , ''
                                , 0);
    }

    static getCopyById(id)
    {
        return this.project_list.find((element)=>{
            if(element.id == id)
            {
                return true;
            }
            else
            {
                return false;
            }
        });
    }

    static getIndexById(id)
    {
        return this.project_list.findIndex((element)=>{
                    if(element.id == id)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                });
    }

    static getList()
    {
        return this.project_list;
    }
}

module.exports = ProjectClass;