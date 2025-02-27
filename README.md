### Summary: Include screen shots or a video of your app highlighting its features

<img src="https://github.com/user-attachments/assets/081ccfc2-ad77-4347-afaa-b94fd2ca0bc2" height="500">

This app is very simple, it is a basic list of recipes called from an API. The recipes populate into a ScrollView. Users can scroll through the full list of recipes and can swipe down from the top to refresh the list. Users can tap the links underneath each recipe to view the full recipe on the web or watch a video demonstration on YouTube. Recipes that do not have an associated website or YouTube video are marked accordingly.

Recipes can be sorted alphabetically by Name or by Cuisine.

<img src="https://github.com/user-attachments/assets/0009fbc6-609b-40ae-b9d2-32cb64ee5822" height="100">

If no recipes are found at the API URL, the app will respond appropriately.

<img src="https://github.com/user-attachments/assets/f6da3631-da6d-46be-aeeb-3351db6c5534" height="200">

If an error occurs at any point while loading the data from the API, an error popup will let users know what happened.

<img src="https://github.com/user-attachments/assets/217743e7-6979-4684-b7f3-dfe798ce61ed" height="300">

Three basic tests make sure that the API call is functioning correctly. Recipes are successfully retrieved when the API has data to provide, no recipes are retrieved and the process aborts in the event that the API's data is malformed, and the app displays an empty state when the API contains no data.

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

I prioritized working on the API call functions, as that part of the app is most likely to encounter errors. I implemented error handling with enums to manage the potential errors that could occur when calling the API.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

I spent about 5-6 hours working on this. A lot of that time was spent reviewing Swift documentation and best practices for error handling and API calls in Swift.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

For simplicity's sake I kept all of the API call functionality in the same file as the main app view (ContentView). I believe best practice for Swift would be to separate these in another file, but as this is a small project I decided to keep it simple.

### Weakest Part of the Project: What do you think is the weakest part of your project?

I think the weakest part of my project is the UI. I tried to make it look clean and ordered, which I think I did accomplish, but it also turned out looking relatively simplistic.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

I had a great time working on this project!
