echo -e "==================================================";
echo -e "=== MOVING to terraform-aws-course-ro directory ==";
echo -e "===================================================";

cd terraform-aws-course-ro;
sleep 2;

git checkout master;

echo -e "===============================================";
echo -e "========== SWITCHING to master branch ===========";
echo -e "===============================================";


git pull;

eval "terraform --version";