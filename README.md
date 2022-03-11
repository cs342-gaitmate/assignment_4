<p>&nbsp;</p>

# GaitMate

GaitMate is an iOS research app developed at Stanford University. Physicians from the Stanford Health Care Department for Emergency Medicine paired up with students at the Stanford Byers Center for Biodesign to build a user-friendly app using Stanford’s Cardinal Kit to automate at-home safe functional mobility assessments and ultimately build predictive models using at-home data. Apple's open source frameworks ResearchKit and CareKit were used to realize the app.
<p>&nbsp;</p>

<img width="1332" alt="Overview" src="https://user-images.githubusercontent.com/97294398/157364817-56d65cc8-7c99-47bc-a22d-2ffe847ac31a.png">

<p>&nbsp;</p>

Includes:
* Informed consent process using ResearchKit.
* Track day-to-day adherence with CareKit.
* CoreMotion accelerometer data collection.
* Gait task to assess functional mobility.
* GCP Firebase Integration to store data.
* Fall risk prediction using a pretrained gait identification PyTorch model.
* Report a Fall feature.
* Push notifications.
* SwiftUI interfaces.

<p>&nbsp;</p>

## Features

### Onboarding
When first downloading the app, the user is taken through an onboarding process. Login via Apple, Google or Email and password is supported. 

### Informed Consent
The app includes a visual consent template explaining the details of the research study with a signature screen.

### Onboarding Survey
On first use, the app collects general demographic and health-related data from the study participant.

### Gait Task
The gait task is a modified version of the ResearchKit Active Task called Gait and Balance. It records the user's gait data, stores it in Google Firebase, and sends it to our gait identification model for fall risk analysis.

### Report a Fall
The Report a Fall feature is a weekly survey asking the study participant if they fell in the past week. A ResearchKit survey is used for the digital questionnaire. The data is stored in Firebase.

### Schedule
A CareKit schedule is used to display completed and upcoming tasks to the user. The schedule includes the Gait Task and Report a Fall. 

### Notifications
The app reminds the user of the scheduled tasks by sending monthly (Gait Task) and weekly (Report a Fall) local push notifications.

### Contacts
A contact tab is provided to display the contact information of the participants' physicians at Stanford Health Care.

<p>&nbsp;</p>

## Getting Started

Requirements:
The GaitMate codebase supports iOS and requires Xcode 8.0 or newer.

Installation:
Clone the lasted version of the main branch of this repository to get started.

Building:
Open the file CardinalKit.xcworkspace and run the app on a simulator from Xcode. To collect real accelerometer data you need an Apple Developer account to test it on your iPhone.

<p>&nbsp;</p>

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://www.linkedin.com/in/laura-sch%C3%BCtz-61b806154/"><img src="https://media-exp1.licdn.com/dms/image/C4D03AQHwHSSxjGhHdQ/profile-displayphoto-shrink_400_400/0/1587747218324?e=1652313600&v=beta&t=t1yBFG2jOlT5TTVEhX3bCGYUmBU6Ul7NTGIdcKfzXHA" width="100px;" alt=""/><br /><sub><b>Laura Schütz</b></sub></a></td>
    <td align="center"><a href="https://www.linkedin.com/in/ankush-dhawan/"><img src="https://media-exp1.licdn.com/dms/image/C4D35AQFlwcpGJTTiTA/profile-framedphoto-shrink_400_400/0/1607399092643?e=1646884800&v=beta&t=NYB01NRX3vFsT3Z8Wjvw8Ls3d7uSZXRbz7vfaZunGog" width="100px;" alt=""/><br /><sub><b>Ankush Dhawan</b></sub></a></td>
    <td align="center"><a href="https://www.linkedin.com/in/raghavsamavedam/?trk=public_profile_browsemap"><img src="https://media-exp1.licdn.com/dms/image/C4D03AQEjlrmzl-YNpg/profile-displayphoto-shrink_400_400/0/1637268710144?e=1652313600&v=beta&t=OlHJzq6zipElkTZVDvhPlXRwHiYf8adix3PG1Qw-xQo" width="100px;" alt=""/><br /><sub><b>Raghav Samavedam</b></sub></a></td>
    <td align="center"><a href="https://www.linkedin.com/in/amita-gondi/"><img src="https://media-exp1.licdn.com/dms/image/C4D03AQFVp2TONbQjrQ/profile-displayphoto-shrink_400_400/0/1611691675532?e=1652313600&v=beta&t=BTdPqTnWqy3gp2QGESRDAR_WEs6O2lZ4XWKqhB3onlE" width="100px;" alt=""/><br /><sub><b>Amita Gondi</b></sub></a></td>
  </tr>
</table>

<p>&nbsp;</p>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

