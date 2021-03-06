class SezyumController < ApplicationController
  unloadable

  before_filter :find_project, :authorize, :only => :index

  def index
    respond_to do |frmt|
      frmt.html do
        @project = Project.find params[:project_id]
        @members = @project.users
        @total_hours = Hash.new

        time_entries = TimeEntry.all.select do |entry|
          entry.project_id == @project.id
        end

        @members.each do |member|
          member_entries = time_entries.select do |entry|
            entry.user_id == member.id
          end
          total = 0
          member_data = Array.new
          member_entries.each do |entry|
            total += entry.hours
          end
          @total_hours[member.id] = total
        end
      end
      frmt.js do
        @project_id = params[:project_id]
        @user_id = params[:user_id]
        @details = Array.new
        @total_hours = 0

        @user_name = (User.find @user_id).name

        hue = Random.new.rand 0..360

        @time_entries = TimeEntry.all.select do |entry|
          entry.project_id == @project_id.to_i
        end

        member_entries = @time_entries.select do |entry|
          entry.user_id == @user_id.to_i
        end
        @details = Array.new

        member_entries.each do |entry|
          entry_data = Hash.new
          entry_data[:date] = entry.spent_on.strftime "%d/%m/%Y"
          entry_data[:activity] = entry.activity_id = 8 ? t(:design) : t(:devel)
          entry_data[:issue_subject] = (Issue.find entry.issue_id).subject
          entry_data[:comment] = entry.comments
          entry_data[:spent_time] = entry.hours
          @total_hours +=  entry.hours
          hue = (hue + 111) % 360;
          entry_data[:hue] = hue
          @details.push entry_data
        end
      end
    end
  end

  private
  def find_project
    @project = Project.find params[:project_id]
  end
end
