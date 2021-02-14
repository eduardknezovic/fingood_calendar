<template>
  <section class="container">


    <div class="no-print">
      <!--
      <CalendarInput></CalendarInput>
      -->

      <h1>
        FinGood calendar
      </h1>

      <div>
        <b-datepicker v-model="formInput['DrawFrom']"></b-datepicker>
        <b-datepicker v-model="formInput['FirstDate']"></b-datepicker>
        <b-form-input v-model="formInput['Debt']" type="number" placeholder="Enter Debt"></b-form-input>
        <b-form-input v-model="formInput['InterestRatePrc']" type="number" placeholder="Enter Interest Rate Percentage"></b-form-input>
        <b-form-input v-model="formInput['PaymentCount']" type="number" placeholder="Enter Payment Count"></b-form-input>
        <b-form-input v-model="formInput['PaymentPeriod']" type="number" placeholder="Enter Payment Period"></b-form-input>
        <b-button @click="getTableRows()">Get Table</b-button>
      </div>
    </div>

    <!--
    <CalendarTable></CalendarTable>
    -->

    <b-table
      borderless
      :items="items"
      class="calendar-table col-sm-1"
    ></b-table>

  </section>
</template>

<script>
import CalendarInput from '~/components/CalendarInput.vue'
import CalendarTable from '~/components/CalendarTable.vue'

export default {
  components: {
    CalendarInput,
    CalendarTable
  },
  data() {
    return {
      formInput: {
        "DrawFrom": new Date(this.$route.query.drawFrom),
        "FirstDate": new Date(this.$route.query.firstDate),
        "Debt": this.$route.query.debt,
        "InterestRatePrc": this.$route.query.interest,
        "PaymentCount": this.$route.query.paymentCount,
        "PaymentPeriod": this.$route.query.paymentPeriod,
      },
      rows: [],
      test_rows: [
        {
            "Number": 1,
            "Date": "2020-03-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 816666.67,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 816666.67
        },
        {
            "Number": 2,
            "Date": "2020-04-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 3,
            "Date": "2020-05-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 4,
            "Date": "2020-06-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 5,
            "Date": "2020-07-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 6,
            "Date": "2020-08-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 7,
            "Date": "2020-09-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 8,
            "Date": "2020-10-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 9,
            "Date": "2020-11-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 10,
            "Date": "2020-12-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 11,
            "Date": "2021-01-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 12,
            "Date": "2021-02-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 13,
            "Date": "2021-03-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 14,
            "Date": "2021-04-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 15,
            "Date": "2021-05-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 16,
            "Date": "2021-06-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 17,
            "Date": "2021-07-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 18,
            "Date": "2021-08-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 19,
            "Date": "2021-09-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 20,
            "Date": "2021-10-10T11:39:33.912Z",
            "Principal": 0.0,
            "Interest": 500000.00,
            "Debt": 50000000.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 500000.00
        },
        {
            "Number": 21,
            "Date": "2021-11-10T11:39:33.912Z",
            "Principal": 50000000.0,
            "Interest": 500000.00,
            "Debt": 0.0,
            "PaidAmount": 0.0,
            "PaidDate": "1900-01-01T00:00:00",
            "Amount": 50500000.00
        }
    ]
    }
  },
  methods: {
    getTableRows() {
      console.log("Hello!")
      console.log(this.formInput)
      var url = "https://be-staging.fingood.cz:55400/api/common/SimulateCalendar"
      const PATH_API = "/api/common/SimulateCalendar"
      url = `/api/v1${PATH_API}`
      // const url = "/api"
      const response = this.$axios.post(url, this.formInput).then(response => {
        this.rows = response.data["Rows"]
      })
    }
  },
  computed: {
    items() {
      var formatted
      formatted = this.rows.map(row => {

        const formatter = new Intl.NumberFormat('cs', {
          style: 'currency',
          currency: 'CZK',
          minimumFractionDigits: 2
        })

        delete row["Number"]
        row["Date"] = new Date(row["Date"]).toLocaleDateString('cs')
        //row["Date"] = "1.1.2020"
        row["PaidDate"] = new Date(row["PaidDate"]).toLocaleDateString('cs')
        // row["PaidDate"] = "2.2.2020"
        row["Amount"] = formatter.format(row["Amount"])
        row["Interest"] = formatter.format(row["Interest"])
        row["Debt"] = formatter.format(row["Debt"])
        // row["PaidAmount"] = 20000000
        row["PaidAmount"] = formatter.format(row["PaidAmount"])
        row["Principal"] = formatter.format(row["Principal"])
        return row
      })

      /*
      Use this to test long outputs?
      formatted.push.apply(formatted, formatted)
      formatted.push.apply(formatted, formatted)
      */

      /*
      What do we need to do here?
      - Remove the number ?
      - Format dates to cz
      - Format money to cz
       */

      return formatted
    }
  },
  beforeMount() {
    console.log(this.formInput["Debt"])
    // check if all of the values are present needed to make the request
    // if yes, make the request!
    console.warn(this.formInput["PaymentPeriod"])
    var someValueMissing = Object.keys(this.formInput).some(key => this.formInput[key] === undefined)
    if (someValueMissing) {
      return
    }
    this.getTableRows()
  }
}
</script>

<style>

  .calendar-table {
    width: 1200px !important;
    white-space: pre;
    font-size: 20px;
  }

  @media print {

    @page {
      size: auto;   /* auto is the initial value */
      margin: 0;  /* this affects the margin in the printer settings */
    }

    .calendar-table {
      white-space: pre;
      font-size: 12px;
      border-collapse: collapse;
    }


    .no-print, .no-print *
    {
      display: none !important;
    }
  }

</style>
