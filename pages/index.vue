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
        <div class="error" v-if="!$v.DrawFrom.required">Field is required</div>
        <b-datepicker v-model="form['DrawFrom']"></b-datepicker>
        <b-datepicker v-model="form['FirstDate']"></b-datepicker>
        <b-form-input v-model="form['Debt']" type="number" placeholder="Enter Debt"></b-form-input>
        <b-form-input v-model="form['InterestRatePrc']" type="number" placeholder="Enter Interest Rate Percentage"></b-form-input>
        <b-form-input v-model="form['PaymentCount']" type="number" placeholder="Enter Payment Count"></b-form-input>
        <b-form-input v-model="form['PaymentPeriod']" type="number" placeholder="Enter Payment Period"></b-form-input>
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
import { required } from 'vuelidate/lib/validators'

export default {
  components: {
    CalendarInput,
    CalendarTable
  },
  data() {
    return {
      form: {
        DrawFrom: new Date(this.$route.query.drawFrom),
        FirstDate: new Date(this.$route.query.firstDate),
        Debt: this.$route.query.debt,
        InterestRatePrc: this.$route.query.interest,
        PaymentCount: this.$route.query.paymentCount,
        PaymentPeriod: this.$route.query.paymentPeriod,
      },
      rows: [],
    }
  },
  validations: {
    DrawFrom: {
      required
    },
    FirstDate: {
      required
    },
    Debt: {
      required
    },
    InterestRatePrc: {
      required
    },
    PaymentCount: {
      required
    },
    PaymentPeriod: {
      required
    },
  },
  methods: {
    getTableRows() {
      // var url = "https://be-staging.fingood.cz:55400/api/common/SimulateCalendar"
      const PATH_API = "/api/common/SimulateCalendar"
      var url = `/api/v1${PATH_API}`
      // const url = "/api"
      const response = this.$axios.post(url, this.form).then(response => {
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
    // check if all of the values are present needed to make the request
    // if yes, make the request!
    var someValueMissing = Object.keys(this.form).some(key => this.form[key] === undefined)
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
