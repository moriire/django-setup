cat 007.txt;

errors(){
        red='\033[31m';
        nc='\033[0m';
        txt="$red $1 $nc";
        echo -e $txt;
};

success(){                               green='\033[32m';               nc='\033[0m';                   txt="$green $1 $nc";              echo -e $txt;
};

pers(){
        while read -p $1 $2;
do
        if [ ! $2 ]; then
                echo $1;
                continue
        return $2;
        fi;
        done;
        };

venv(){                             python3 -m venv env;        source env/bin/activate;                                pip install django;};
proj() {
        #source env/bin/activate;
        if [ -d $1 ];
        then
                errors "$1 already exists";
                cd $1;
        else
                django-admin startproject $1 && success "project $1 created";
cd $1;
        fi;
};



app(){
        if [ -d './$2/$1' ]; then
                errors $1 already exists.
        else
                python3 manage.py startapp $1 && success "an app $1 is created on project $2";
        fi;
};

config(){
        cd $1;
        success "Development starting at $1";
};
dpurls(){
        if [ -f "./$1/urls.py" ];
        then
        rm "./$1/urls.py" &&            touch "./$1/urls.py";
else
        touch "./$1/urls.py";
        fi;
echo -e purl >> "./$1/urls.py";
};

dpapps(){
        if [ -f "./$2/urls.py" ];
                then
                        rm "./$2/urls.py";            touch "./$2/urls.py";
                else
                        touch "./$2/urls.py";
                        fi;
                        echo -e aurl >> "./$2/urls.py";                        };

appview(){
        if [ -f "./$2/views.py" ]; then
        rm "./$2/views.py";
        touch "./$2/views.py";
else
        touch "./$2/views.py";
        fi;
echo -e appv >> "./$2/views.py";
};

psettings(){                               rm "./$1/settings.py";            touch "./$1/settings.py";         echo -e settings >> "./$1/settings.py";                     };

while read -p "Dev folder: " devloc;
do
        if [[ $devloc == '' || $devloc == ' ' ]]; then
                errors "Input cannot be empty. Give your root folder a name";
                continue;
        else
                config $devloc;
                break
        fi
done;

if [ ! -d django-setup ];
then
        echo starting;
mkdir django-setup && cd django-setup;
echo setting up environment..
venv;
echo Virtual environment created.;
else
        cd django-setup;
        errors "Like this project already exists";
        echo continue...;
fi;
read -p "Project Name[unamed]: " projname;
if [[ $projname == '' || $projname == ' ' ]]; then
        projname='unamed';
fi;

        if [ ! -d $projname ]; then
                proj $projname;
else
        rm -r $projname;
        proj $projname;
fi;
        read -p "App Name: " appname;
        app $appname $projname &&
        python3 ../../config.py "$projname" "$appname" && echo home page successfully setup.;
        if [ ! -d "./$appname/templates/" ];
        then
                mkdir "./$appname/templates" && echo templates folder created
                else
                        echo templates folder created;
        fi && cp -r "../../assets/index.html" "./$appname/templates"
if [ ! -d "./$appname/static/" ];
        then
                mkdir "./$appname/static" && echo static folder created
                else
                        echo static folder created... ;
        fi && cp -r "../../assets/js" "./$appname/static/" && cp -r "../../assets/css" "./$appname/static/" && python3 manage.py migrate && read -p "Server Addr['localhost:8000']" url && python3 manage.py runserver $url && python3 ../../browser.py $url;
