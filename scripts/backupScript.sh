# Define backup directory
BACKUP_DIR="C:\Users\osama\OneDrive\Desktop\backup"
LOG_FILE="$BACKUP_DIR/rman_backup_$(date +%Y%m%d_%H%M%S).log"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Run RMAN backup
rman target faculty/123 <<EOF > $LOG_FILE 2>&1
RUN {
  # Allocate a channel and specify the backup directory
  ALLOCATE CHANNEL c1 DEVICE TYPE DISK FORMAT '${BACKUP_DIR}/%U';

  # Perform the backup
  BACKUP DATABASE;

  # Release the channel
  RELEASE CHANNEL c1;
}
EXIT;
EOF

# Check if the backup was successful
if grep -q "Finished backup" $LOG_FILE; then
  echo "RMAN backup completed successfully. Log file: $LOG_FILE"
else
  echo "RMAN backup failed. Check the log file: $LOG_FILE"
fi