if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

levels = [steamy_secret_1,steamy_secret_2,steamy_secret_3,entryway_secret_1,entryway_secret_2,entryway_secret_3,
molasses_secret_1,molasses_secret_2,molasses_secret_3,mineshaft_secret_1,mineshaft_secret_2,mineshaft_secret_3,
mountain_secret_1,mountain_secret_2,mountain_secret_3,cafe_secret_1,cafe_secret_2,cafe_secret_3];
selected = false;
selected_level = -4;
minutes = 0;
seconds = 0;
start = false;
startstate = 1;
depth = -999;
