resource "google_monitoring_dashboard" "dashboard" {
  project = "${var.project_id}"
  dashboard_json = {
  "displayName": "Active Users Sample",
  "mosaicLayout": {
    "columns": 48,
    "tiles": [
      {
        "yPos": 5,
        "width": 15,
        "height": 11,
        "widget": {
          "title": "Rolling Monthly Active Users",
          "scorecard": {
            "timeSeriesQuery": {
              "opsAnalyticsQuery": {
                "savedQueryId": "",
                "sql": "SELECT JSON_VALUE(labels.user_id) AS user_id, TIMESTAMP_TRUNC(timestamp, MONTH) as date,\n  FROM `${var.project_id}.global._Default._Default` \n  WHERE resource.type = \"cloudaicompanion.googleapis.com/Instance\" ",
                "queryHandle": "",
                "queryExecutionRules": {
                  "useReservedSlots": false
                }
              },
              "unitOverride": "",
              "outputFullDuration": false
            },
            "sparkChartView": {
              "sparkChartType": "SPARK_LINE"
            },
            "thresholds": [],
            "dimensions": [
              {
                "column": "date",
                "columnType": "TIMESTAMP",
                "timeBinSize": "0s",
                "maxBinCount": 0,
                "sortOrder": "SORT_ORDER_ASCENDING",
                "sortColumn": "date"
              }
            ],
            "measures": [
              {
                "column": "user_id",
                "aggregationFunction": {
                  "type": "count-distinct-approx",
                  "parameters": []
                }
              }
            ]
          },
          "id": ""
        }
      },
      {
        "xPos": 16,
        "yPos": 5,
        "width": 16,
        "height": 11,
        "widget": {
          "title": "Rolling Weekly Active Users",
          "scorecard": {
            "timeSeriesQuery": {
              "opsAnalyticsQuery": {
                "savedQueryId": "",
                "sql": "-- SELECT \n--   TIMESTAMP_TRUNC(timestamp, MONTH) as date,\n--   COUNT(DISTINCT user_id) AS unique_user_count\n-- FROM (\n--   SELECT JSON_VALUE(labels.user_id) AS user_id, timestamp\n--   FROM `${var.project_id}.global._Default._Default` \n--   WHERE resource.type = \"cloudaicompanion.googleapis.com/Instance\" AND date(timestamp) between date_sub(current_date, interval 30 day) and current_date\n-- ) \n-- GROUP BY 1\n-- ORDER BY 1 ASC;\n\nSELECT JSON_VALUE(labels.user_id) AS user_id, TIMESTAMP_TRUNC(timestamp, WEEK) as date,\n  FROM `${var.project_id}.global._Default._Default` \n  WHERE resource.type = \"cloudaicompanion.googleapis.com/Instance\" \n\n",
                "queryHandle": "",
                "queryExecutionRules": {
                  "useReservedSlots": false
                }
              },
              "unitOverride": "",
              "outputFullDuration": false
            },
            "sparkChartView": {
              "sparkChartType": "SPARK_LINE"
            },
            "thresholds": [],
            "dimensions": [
              {
                "column": "date",
                "columnType": "TIMESTAMP",
                "timeBinSize": "0s",
                "maxBinCount": 0,
                "sortOrder": "SORT_ORDER_ASCENDING",
                "sortColumn": "date"
              }
            ],
            "measures": [
              {
                "column": "user_id",
                "aggregationFunction": {
                  "type": "count-distinct-approx",
                  "parameters": []
                }
              }
            ]
          },
          "id": ""
        }
      },
      {
        "xPos": 33,
        "yPos": 5,
        "width": 15,
        "height": 11,
        "widget": {
          "title": "Rolling Daily Active Users",
          "scorecard": {
            "timeSeriesQuery": {
              "opsAnalyticsQuery": {
                "savedQueryId": "",
                "sql": "-- SELECT \n--   TIMESTAMP_TRUNC(timestamp, MONTH) as date,\n--   COUNT(DISTINCT user_id) AS unique_user_count\n-- FROM (\n--   SELECT JSON_VALUE(labels.user_id) AS user_id, timestamp\n--   FROM `${var.project_id}.global._Default._Default` \n--   WHERE resource.type = \"cloudaicompanion.googleapis.com/Instance\" AND date(timestamp) between date_sub(current_date, interval 30 day) and current_date\n-- ) \n-- GROUP BY 1\n-- ORDER BY 1 ASC;\n\nSELECT JSON_VALUE(labels.user_id) AS user_id, TIMESTAMP_TRUNC(timestamp, DAY) as date,\n  FROM `${var.project_id}.global._Default._Default` \n  WHERE resource.type = \"cloudaicompanion.googleapis.com/Instance\" \n\n",
                "queryHandle": "",
                "queryExecutionRules": {
                  "useReservedSlots": false
                }
              },
              "unitOverride": "",
              "outputFullDuration": false
            },
            "sparkChartView": {
              "sparkChartType": "SPARK_LINE"
            },
            "thresholds": [],
            "dimensions": [
              {
                "column": "date",
                "columnType": "TIMESTAMP",
                "timeBinSize": "0s",
                "maxBinCount": 0,
                "sortOrder": "SORT_ORDER_ASCENDING",
                "sortColumn": "date"
              }
            ],
            "measures": [
              {
                "column": "user_id",
                "aggregationFunction": {
                  "type": "count-distinct-approx",
                  "parameters": []
                }
              }
            ]
          },
          "id": ""
        }
      },
      {
        "yPos": 16,
        "width": 48,
        "height": 19,
        "widget": {
          "title": "30 Day Rolling Last User Login",
          "timeSeriesTable": {
            "dataSets": [
              {
                "timeSeriesQuery": {
                  "opsAnalyticsQuery": {
                    "savedQueryId": "",
                    "sql": "\nSELECT JSON_VALUE(labels.user_id) AS user_id, min(timestamp) AS date,\n  FROM `${var.project_id}.global._Default._Default` \n  WHERE resource.type = \"cloudaicompanion.googleapis.com/Instance\" \n  GROUP BY 1\n\n",
                    "queryHandle": "CghNlbDVJO7DABIgam9iX0NHSFFrOEczVndnay1NMnJsbEhQRmo3Sm9CU2QaAlVTQJy3nZOmGA",
                    "queryExecutionRules": {
                      "useReservedSlots": false
                    }
                  },
                  "unitOverride": "",
                  "outputFullDuration": false
                },
                "tableTemplate": "",
                "minAlignmentPeriod": "0s"
              }
            ],
            "metricVisualization": "NUMBER",
            "columnSettings": [],
            "opsAnalyticsSettings": {
              "maxRows": "0",
              "showFilterBar": false,
              "pageSize": "0"
            },
            "displayColumnType": false
          },
          "id": ""
        }
      },
      {
        "width": 48,
        "height": 5,
        "widget": {
          "text": {
            "content": "**NOTE**   \n Be sure that the timeframe window in the top right corner of the dashboard is set to '30d' for the 'Last 30 days' to have a rolling 30 day window of data. Reducing that window will reduce the available data for all charts",
            "format": "MARKDOWN",
            "style": {
              "backgroundColor": "#FFFFFF",
              "fontSize": "FS_LARGE",
              "horizontalAlignment": "H_LEFT",
              "padding": "P_EXTRA_SMALL",
              "pointerLocation": "POINTER_LOCATION_UNSPECIFIED",
              "textColor": "#212121",
              "verticalAlignment": "V_TOP"
            }
          }
        }
      }
    ]
  },
  "dashboardFilters": [],
  "labels": {}
}

}