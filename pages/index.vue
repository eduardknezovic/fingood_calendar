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
      striped
      hover
      :items="items"
      responsive="sm"
      thead-tr-class="thead-class"
      tbody-tr-class="tbody-class"
      class="col-sm-2"
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
          "Date": "2021-02-11T11:39:33.912Z",
          "Principal": 0.0,
          "Interest": 2916.67,
          "Debt": 1000000.0,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 2916.67
        },
        {
          "Number": 2,
          "Date": "2021-03-11T11:39:33.912Z",
          "Principal": 0.0,
          "Interest": 4166.67,
          "Debt": 1000000.0,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 4166.67
        },
        {
          "Number": 3,
          "Date": "2021-04-11T11:39:33.912Z",
          "Principal": 245570.99,
          "Interest": 4166.67,
          "Debt": 754429.01,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 249737.66
        },
        {
          "Number": 4,
          "Date": "2021-05-11T11:39:33.912Z",
          "Principal": 0.0,
          "Interest": 3143.45,
          "Debt": 754429.01,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 3143.45
        },
        {
          "Number": 5,
          "Date": "2021-06-11T11:39:33.912Z",
          "Principal": 0.0,
          "Interest": 3143.45,
          "Debt": 754429.01,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 3143.45
        },
        {
          "Number": 6,
          "Date": "2021-07-11T11:39:33.912Z",
          "Principal": 247390.65,
          "Interest": 3143.45,
          "Debt": 507038.36,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 250534.10
        },
        {
          "Number": 7,
          "Date": "2021-08-11T11:39:33.912Z",
          "Principal": 0.0,
          "Interest": 2112.66,
          "Debt": 507038.36,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 2112.66
        },
        {
          "Number": 8,
          "Date": "2021-09-11T11:39:33.912Z",
          "Principal": 0.0,
          "Interest": 2112.66,
          "Debt": 507038.36,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 2112.66
        },
        {
          "Number": 9,
          "Date": "2021-10-11T11:39:33.912Z",
          "Principal": 250483.02,
          "Interest": 2112.66,
          "Debt": 256555.34,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 252595.68
        },
        {
          "Number": 10,
          "Date": "2021-11-11T11:39:33.912Z",
          "Principal": 0.0,
          "Interest": 1068.98,
          "Debt": 256555.34,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 1068.98
        },
        {
          "Number": 11,
          "Date": "2021-12-11T11:39:33.912Z",
          "Principal": 0.0,
          "Interest": 1068.98,
          "Debt": 256555.34,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 1068.98
        },
        {
          "Number": 12,
          "Date": "2022-01-11T11:39:33.912Z",
          "Principal": 256555.34,
          "Interest": 1068.98,
          "Debt": 0.0,
          "PaidAmount": 0.0,
          "PaidDate": "1900-01-01T00:00:00",
          "Amount": 257624.32
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
        //row["Date"] = new Date(row["Date"]).toLocaleDateString('cs')
        row["Date"] =
        row["PaidDate"] = new Date(row["PaidDate"]).toLocaleDateString('cs')
        row["Amount"] = formatter.format(row["Amount"])
        row["Interest"] = formatter.format(row["Interest"])
        row["Debt"] = formatter.format(row["Debt"])
        row["PaidAmount"] = formatter.format(row["PaidAmount"])
        row["Principal"] = formatter.format(row["Principal"])
        return row
      })
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

  .thead-class {
    font-size: 20px;
  }

  .tbody-class {
    font-size: 14px;
  }

  @media print {


    @page {
      size: A4;   /* auto is the initial value */
      margin: 0;  /* this affects the margin in the printer settings */
    }

    .print, .print * {
    }


    .no-print, .no-print *
    {
      display: none !important;
    }
  }

</style>
