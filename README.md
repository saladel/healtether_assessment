# Flutter Developer Task - HealTether Healthcare Pvt Ltd

## Task Overview:

Build a simple Flutter app that fetches data from an API and displays it in a list.
You are required to:
- Fetch data from a remote API.
- Display the data in a list using a ListView.
- Implement basic state management using Provider or Riverpod.
- Handle loading and error states appropriately.

## API Details:

For this task, we will use the following free API that returns a list of users:

#### API URL: https://jsonplaceholder.typicode.com/users

## Task Requirements:

### UI Design:

The app should have a basic UI with a ListView to display a list of user names and emails.
Each item in the list should show:
- User's name
- User's email
- A small user avatar (use a placeholder image like this).

### State Management:

Use Provider or Riverpod for state management.
The app should handle three states:
- Loading state: Show a loading indicator while the data is being fetched.
- Data state: Once the data is loaded, show the list of users.
- Error state: Display an error message if the data fetch fails (e.g., if the API request fails).

### Network Request:

Use the http package to make the network request.
You should display an error message in case the request fails (e.g., network issues, server errors).
Bonus (Optional):
- Implement pull-to-refresh functionality.
- Implement a simple search functionality that filters the list of users based on the name.

## Submission Summary

This project makes use of the JsonPlaceHolder API to fetch a list of users and display a place holder image as well as the user name and user email.

I made use of the HTTP package for the network call

I made use of the Provider package for state management.