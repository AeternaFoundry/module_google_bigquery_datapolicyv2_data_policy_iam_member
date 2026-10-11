resource "google_bigquery_datapolicyv2_data_policy_iam_member" "bigquery_datapolicyv2_data_policy_iam_members" {
  for_each = var.bigquery_datapolicyv2_data_policy_iam_members

  data_policy_id = each.value.data_policy_id
  member         = each.value.member
  role           = each.value.role
  location       = each.value.location
  project        = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

