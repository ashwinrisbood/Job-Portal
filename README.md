 ### deployed at :https://fathomless-brook-57752.herokuapp.com/

Admin Account: admin@woodendoor.com
Password: adminpassword

Google_recruiter: google_recruiter@google.com
Password: google

Facebook_recruiter: facebook_recruiter@facebook.com
Password: facebook

Seekers:

1. Account: spoudwa@ncsu.edu
   Password: spoudwa
  
2. Account: arisboo@ncsu.edu
      Password: arisboo

3. Account: psinha@ncsu.edu
      Password: psinha
      
 <b>Tested user model, registrations controller.</b>
 <b>FIND THESE TESTS IN SPEC FOLDER</b> 
 <b><I>EMAIL function is working if you use any E-MAIL address except the ncsu e-mail address(ncsu e-mail reports such mails as phishing mails)<I><b>
 Use login to signup after an account is created. You can use the default login credentials given above or you can create a new user using the signup tab in the top right.
 
 ## <b>Admin's Tasks to note:- </b>
 
 1. If a job seeker is deleted by the Admin,all of job seeker's applications will be deleted.
 2. If a recruiter is deleted by the Admin,all of job posted by this person will be deleted.
 3. Admin will be able to find information such as job seekers' applications and jobs posted by recruiters.
 4. Visit the Applications tab to see all applications in the databse.
 5. If a company is deleted by the Admin, all jobs from this company will be deleted.
 6. If a job is deleted by the Admin, all applications for this job will be deleted.
 
## <b> Job seeker's Tasks to note:- </b> 
 
 1. Job Seeker cannot apply to a job without creating a profile. 
 2. He can visit the company tab to checkout all the lists of company.
 3. Job Seeker is only allowed to read the company info.
 4. He can look up all the lists of jobs posted in the website and can search for keywords of a job in the search bar.
 5. Job seeker can submit applications for a job by clicking on the apply button next to the job posting.
 6. The resume for your application is pulled from your profile, so that you don't have to attach your resume multiple times while 
    applying. If you edit your resume in the profile, it gets updated in all your past applications.
    
## <b> Job poster's/Recruiter's Tasks to note:- </b>
 
1. The recruiter should be part of a company to post a job. Also the company is non existant then while creating a profile you will be redirected to new company page in which you create the company first. After this you can choose this company from the drop down to select it as your company in your signup page.
2. Recruiter is only allowed to Read applications/ update status for the jobs in his/her company.
3. Recruiter is not allowed to Create/Update/Delete jobs posted by other Recruiters.
4. Recruiter can select a candidate for a job he/she posted by clicking on the select button next to the applicant in the applications      tab.
5. After a candidate is selected he/she will <b>recieve an email</b> in the registered e-mail address and the candidates who are not selected      recieve a rejection in their inbox.