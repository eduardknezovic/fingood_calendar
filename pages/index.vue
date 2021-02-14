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
      <h4>Draw From:</h4>
      <b-datepicker v-model="drawFrom" locale="cs"></b-datepicker>
        <!--
        <h1>{{drawFrom.toLocaleString('cs')}}</h1>
        -->
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
      drawFrom: new Date(this.$route.query.drawFrom),
      firstDate: new Date(this.$route.query.drawFrom),
      debt: 0,
      interestRatePrc: 0,
      paymentCount: 0,
      paymentPeriod: 0,
      rows: [
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
        row["PaidAmount"] = 20000000
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
