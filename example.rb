#!/usr/bin/ruby

require 'sarvevents'

exit if ARGV.length < 1

eventsxml = ARGV[0]

# Parse the recording's events.xml.
recording = SARVEvents.parse(eventsxml)

# Access recording data.
recording.metadata
recording.meeting_id

# Retrieve start, finish time objects or total duration in seconds.
recording.start
recording.finish
recording.duration

# Returns a list of Attendee objects.
recording.attendees
recording.moderators
recording.viewers

# Returns a list of Poll objects.
recording.polls
recording.published_polls
recording.unpublished_polls

# Returns a list of upload files (names only).
recording.files

# Generate a CSV file with the data.
recording.create_csv("data.csv")

puts "Writing the JSON data"

# Write JSON data to file.
File.open("data.json", 'w') do |f|
  f.write(recording.to_json)
end
