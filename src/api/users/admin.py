from flask_admin.contrib.sqla import ModelView


class UserAdminView(ModelView):
    column_searchable_list = ("username", "email")
    column_editable_list = ("username", "email", "created_date")
    column_filters = ("username", "email", "active", "created_date")
    column_default_sort = ("created_date", True)
