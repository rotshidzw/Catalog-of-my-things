# rubocop:disable Metrics/MethodLength
require './label/label'
# the label class
module AddLabel
  def list_all_label
    if @labels.empty?
      puts_message 'No label listed in the collection'
      return
    end
    @labels.each_with_index do |label, index|
      puts "No.#{index + 1}) Id: #{label.id} | title: #{label.title} | color: #{label.color}"
    end
  end

  def create_label
    label = ''
    if @labels.empty?
      label_title = get_user_input "No exising title to choose from!\n\nEnter title: "
      label_color = get_user_input 'Enter color: '
      label = Label.new(label_title, label_color)
    else
      choose_label = lambda do
        option = get_user_input "Please choose 1 or 2:\n1. Existing title\n2. Create new title:\n"
        case option.to_i
        when 1
          recollect = lambda do
            list_all_label
            label_id = get_user_input 'Choose any title by Id from the list above: '
            label = @labels.find { |item| item.id == label_id.to_i }
            if label.nil?
              puts "\nInvalid id, please choose a valid one\n"
              recollect.call
            end
            puts "Title: #{label.title} selected!\n"
          end
          recollect.call
        when 2
          label_title = get_user_input 'Enter title: '
          label_color = get_user_input 'Enter color: '
          label = Label.new(label_title, label_color)
        else
          choose_label.call
        end
      end
      choose_label.call
    end
    label
  end
end
# rubocop:enable Metrics/MethodLength