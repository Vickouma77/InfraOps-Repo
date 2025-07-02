#!/bin/bash
# This is a script to manage deployments in a shell environment.
# It includes functions to deploy, rollback, and check the status of deployments.

# Function to deploy an application
deploy_application() {
    local app_name=$1
    echo "Deploying application: $app_name"
    # Simulate deployment process
    sleep 2
    echo "Application $app_name deployed successfully."
}

# Function to rollback an application
rollback_application() {
    local app_name=$1
    echo "Rolling back application: $app_name"
    # Simulate rollback process
    sleep 2
    echo "Application $app_name rolled back successfully."
}

# Function to check the status of an application
check_application_status() {
    local app_name=$1
    echo "Checking status of application: $app_name"
    # Simulate status check
    sleep 1
    echo "Application $app_name is running smoothly."
}

# Main function to handle user input
main() {
    echo "Welcome to the Deployment Management System"
    echo "Please choose an option:"
    echo "1. Deploy Application"
    echo "2. Rollback Application"
    echo "3. Check Application Status"
    read -p "Enter your choice (1-3): " choice
    case $choice in
        1)
            read -p "Enter application name to deploy: " app_name
            deploy_application "$app_name"
            ;;
        2)
            read -p "Enter application name to rollback: " app_name
            rollback_application "$app_name"
            ;;
        3)
            read -p "Enter application name to check status: " app_name
            check_application_status "$app_name"
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

# Run the main function 
main
# End of script