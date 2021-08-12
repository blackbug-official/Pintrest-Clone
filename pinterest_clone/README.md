# pinterest_clone

A new Flutter project.

## Deploying to firebase

Install the firebase-tools for firebase CLI 

- `sudo npm install -g firebase-tools`

Once that finishes installation, go into the root folder of your web project and run

-  `firebase login`
    
- Click on the link in terminal and login with your account.

Once logged in, run

- `firebase init`

- Select the hosting with space bar and hit enter
- Choose the existing project or create a new project if there is no project
```
    What do you want to use as your public directory? (public) build/web
```

```
Configure as a single-page app (rewrite all urls to /index.html)? Yes
Set up automatic builds and deploys with GitHub? No
File build/web/index.html already exists. Overwrite? No
```

After the initialization run

- `flutter build web --web-renderer html --release`

To deploy the app to firebase run 

- `firebase deploy --only hosting`