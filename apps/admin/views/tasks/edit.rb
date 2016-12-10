module Admin::Views::Tasks
  class Edit
    include Admin::View

    def form
      form_for task_form, id: 'task-form', class: 'task-form pure-form pure-form-stacked' do
        div class: 'task-form__fields' do
          div class: 'input task-form__field pure-control-group' do
            label      :title, for: 'title'
            text_field :title, value: task.title
          end

          div class: 'input task-form__field pure-control-group' do
            label      :body
            text_field :body, value: task.body
          end

          div class: 'input task-form__field pure-control-group' do
            label     :approved
            check_box :approved, checked: checkbox_status
          end

          div class: 'input' do
            select :lang, { 'language' => 'undefined', 'ruby' => 'ruby', 'js' => 'js' }
          end
        end

        div class: 'task-form__actions pure-controls' do
          a 'back', href: routes.task_path(task.id), class: 'pure-button'
          submit 'Update', class: 'pure-button pure-button-primary'
        end
      end
    end

    def task_form
      Form.new(:task, routes.task_path(task.id),
        { task: task }, { method: :patch })
    end

    def params
      {}
    end

    def checkbox_status
      task.approved ? 'checked' : nil
    end

    def tasks_active?
      true
    end
  end
end
