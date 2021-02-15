<template>
  <client-only>
  <section class="container">
    <div class="no-print">

      <h1>
        FinGOOD Investment Calendar
      </h1>

      <div>


        <b-row>
          <b-col>
        <b-form-group label="Draw From">
          <b-form-datepicker :state="validateState('DrawFrom')" v-model="form['DrawFrom']"></b-form-datepicker>
          <b-form-invalid-feedback  v-if="!$v.form.DrawFrom.required">
            This is a required field!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.FirstDate.laterDateThanDrawFrom">
            Must be earlier than "First Date" date!
          </b-form-invalid-feedback>
        </b-form-group>

          </b-col>
          <b-col>
        <b-form-group label="First Date">
          <b-datepicker :state="validateState('FirstDate')"  v-model="form['FirstDate']"></b-datepicker>
          <b-form-invalid-feedback  v-if="!$v.form.FirstDate.required">
            This is a required field!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.FirstDate.laterDateThanDrawFrom">
            Must be later than "Draw From" date!
          </b-form-invalid-feedback>
        </b-form-group>
          </b-col>
        </b-row>



        <b-row>
          <b-col>
        <b-form-group label="Debt">
            <b-form-input :state="validateState('Debt')"  v-model="form['Debt']" type="number" placeholder="CZK"></b-form-input>
          <b-form-invalid-feedback  v-if="!$v.form.Debt.required">
            This is a required field!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.Debt.numeric">
            Must be a number!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.Debt.between">
            Invalid value range!
          </b-form-invalid-feedback>
        </b-form-group>
</b-col>


          <b-col>
        <b-form-group label="Interest Rate">
            <b-form-input :state="validateState('InterestRatePrc')"  v-model="form['InterestRatePrc']" type="number" placeholder="%"></b-form-input>
          <b-form-invalid-feedback  v-if="!$v.form.InterestRatePrc.required">
            This is a required field!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.InterestRatePrc.numeric">
            Must be a number!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.InterestRatePrc.between">
            Invalid value range!
          </b-form-invalid-feedback>
        </b-form-group>
</b-col>
</b-row>

        <b-row>
          <b-col>
        <b-form-group label="Payment Count">
          <b-form-input :state="validateState('PaymentCount')"  v-model="form['PaymentCount']" type="number" placeholder="-"></b-form-input>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentCount.required">
            This is a required field!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentCount.integer">
            Must be an integer!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentCount.between">
            Invalid value range!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentCount.divisibleByThree">
            Must be divisible by 3!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentPeriod.smallerOrEqualThanPaymentCount">
            Must be larger than "Payment Period"!
          </b-form-invalid-feedback>
        </b-form-group>
          </b-col>


        <b-col>
        <b-form-group label="Payment Period">
          <b-form-input :state="validateState('PaymentPeriod')"  v-model="form['PaymentPeriod']" type="number" placeholder="-"></b-form-input>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentPeriod.required">
            This is a required field!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentPeriod.integer">
            Must be an integer!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentPeriod.between">
            Invalid value range!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentPeriod.divisibleByThreeOrIsEqualToOne">
            Must be 1 or divisible by 3!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentPeriod.smallerOrEqualThanPaymentCount">
            Must be equal or smaller than "Payment Count"!
          </b-form-invalid-feedback>
        </b-form-group>
        </b-col>
        </b-row>

        <b-button class="col-lg-12" size="lg"  @click="getTableRows()">Get Table</b-button>
      </div>
    </div>

    <!--
    <CalendarTable></CalendarTable>
    -->

    <client-only>
      <b-table
        borderless
        :items="formattedRows"
        class="calendar-table col-sm-1"
      ></b-table>
    </client-only>

  </section>
  </client-only>
</template>

<script>
import { required, numeric, integer, between } from 'vuelidate/lib/validators'

// custom validators
function smallerOrEqualThanPaymentCount(value) {
  return parseInt(value) <= parseInt(this.form.PaymentCount)
}

function divisibleByThree(value) {
  return !(value % 3)
}

function divisibleByThreeOrIsEqualToOne(value) {
  return divisibleByThree(value) || parseInt(value) === 1
}

function laterDateThanDrawFrom(value) {
  return value > this.form.DrawFrom || !!!this.form.DrawFrom
}


export default {
  components: {
  },
  data() {
    return {
      form: {
        DrawFrom: "",
        FirstDate: "",
        Debt: "",
        InterestRatePrc: "",
        PaymentCount: "",
        PaymentPeriod: ""
      },
      rows: [],
    }
  },
  validations: {
    form: {
      DrawFrom: {
        required,
      },
      FirstDate: {
        required,
        laterDateThanDrawFrom
      },
      Debt: {
        required,
        numeric,
        between: between(0, 1000000000)
      },
      InterestRatePrc: {
        required,
        numeric,
        between: between(0, 60)
      },
      PaymentCount: {
        required,
        integer,
        divisibleByThree,
        between: between(6, 192)
      },
      PaymentPeriod: {
        required,
        integer,
        between: between(1, 192),
        divisibleByThreeOrIsEqualToOne,
        smallerOrEqualThanPaymentCount
      },
    }
  },
  methods: {
    validateState(name) {
      const { $dirty, $error } = this.$v.form[name];
      return $dirty ? !$error : null;
    },
    getTableRows() {
      this.$v.$touch()
      const isInvalid = this.$v.$invalid
      if (isInvalid) {
        this.rows = []
        return
      }
      // var url = "https://be-staging.fingood.cz:55400/api/common/SimulateCalendar"
      const PATH_API = "/api/common/SimulateCalendar"
      var url = `/api/v1${PATH_API}`
      // const url = "/api"
      const response = this.$axios.post(url, this.form).then(response => {
        this.rows = response.data["Rows"]
      })
    },
    loadDataFromRouteQuery() {
      /*
       * Returns true if there is at least one item in query
       */
      const query = this.$route.query
      if (!Object.keys(query).length) {
        return false
      }
      if ("drawFrom" in query) {
        this.form.DrawFrom = new Date(query.drawFrom)
      }
      if ("firstDate" in query) {
        this.form.FirstDate = new Date(query.firstDate)
      }
      if ("debt" in query) {
        this.form.Debt = Number(query.debt)
      }
      if ("interest" in query) {
        this.form.InterestRatePrc = Number(query.interest)
      }
      if ("paymentCount" in query) {
        this.form.PaymentCount = parseInt(query.paymentCount)
      }
      if ("paymentPeriod" in query) {
        this.form.PaymentPeriod = parseInt(query.paymentPeriod)
      }
      return true
    }
  },
  computed: {
    formattedRows() {
      const currencyFormatter = new Intl.NumberFormat('cs', {
        style: 'currency',
        currency: 'CZK',
        minimumFractionDigits: 2
      })

      var formatted = this.rows.map(row => {
        delete row["Number"]
        row["Date"] = new Date(row["Date"]).toLocaleDateString('cs')
        row["PaidDate"] = new Date(row["PaidDate"]).toLocaleDateString('cs')
        row["Amount"] = currencyFormatter.format(row["Amount"])
        row["Interest"] = currencyFormatter.format(row["Interest"])
        row["Debt"] = currencyFormatter.format(row["Debt"])
        row["PaidAmount"] = currencyFormatter.format(row["PaidAmount"])
        row["Principal"] = currencyFormatter.format(row["Principal"])
        return row
      })

      return formatted
    }
  },
  beforeMount() {
    var isQueryNotEmpty = this.loadDataFromRouteQuery()
    if (isQueryNotEmpty) { // so the validator errors will not get triggered!
      this.getTableRows()
    }
  }
}
</script>

<style>

  body {
    padding-top: 40px;
  }

  .calendar-table {
    width: 210mm !important;
    white-space: pre;
    font-size: 18px;
  }

  @media print {

    @page {
      size: A4;   /* auto is the initial value */
      margin: 0;
      padding: 0;
    }

    .calendar-table {
      width: 190mm !important;
      font-size: 12px;
      border-collapse: collapse;
      margin: 0;
      padding: 0;
    }


    .no-print, .no-print *
    {
      display: none !important;
    }
  }

</style>
