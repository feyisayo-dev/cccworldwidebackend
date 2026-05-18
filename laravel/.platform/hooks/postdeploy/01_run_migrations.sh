#!/bin/bash
# This script will run migrations after deployment

# Navigate to the current directory of the application

# Run Laravel migrations
php artisan migrate:fresh --force
php artisan route:clear


