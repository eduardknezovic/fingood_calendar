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


        <b-form-group label="Draw From">
          <b-form-datepicker :state="validateState('DrawFrom')" v-model="form['DrawFrom']"></b-form-datepicker>
          <b-form-invalid-feedback  v-if="!$v.form.DrawFrom.required">
            This is a required field!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.FirstDate.laterDateThanDrawFrom">
            This date must be before the "First Date" date
          </b-form-invalid-feedback>
        </b-form-group>



        <b-form-group label="First Date">
          <b-datepicker :state="validateState('FirstDate')"  v-model="form['FirstDate']"></b-datepicker>
          <b-form-invalid-feedback  v-if="!$v.form.FirstDate.required">
            This is a required field!
          </b-form-invalid-feedback>
          <b-form-invalid-feedback  v-if="!$v.form.FirstDate.laterDateThanDrawFrom">
            This date must be after the "Draw From" date
          </b-form-invalid-feedback>
        </b-form-group>




        <b-form-group label="Debt">
            <b-form-input :state="validateState('Debt')"  v-model="form['Debt']" type="number" placeholder="Enter Debt"></b-form-input>
          <b-form-invalid-feedback  v-if="!$v.form.Debt.required">
            This is a required field!
          </b-form-invalid-feedback>
        </b-form-group>



        <b-form-group label="Interest Rate">
            <b-form-input :state="validateState('InterestRatePrc')"  v-model="form['InterestRatePrc']" type="number" placeholder="Enter Interest Rate Percentage"></b-form-input>
          <b-form-invalid-feedback  v-if="!$v.form.InterestRatePrc.required">
            This is a required field!
          </b-form-invalid-feedback>
        </b-form-group>



        <b-form-group label="Payment Count">
          <b-form-input :state="validateState('PaymentCount')"  v-model="form['PaymentCount']" type="number" placeholder="Enter Payment Count"></b-form-input>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentCount.required">
            This is a required field!
          </b-form-invalid-feedback>
        </b-form-group>


        <b-form-group label="Payment Period">
          <b-form-input :state="validateState('PaymentPeriod')"  v-model="form['PaymentPeriod']" type="number" placeholder="Enter Payment Period"></b-form-input>
          <b-form-invalid-feedback  v-if="!$v.form.PaymentPeriod.required">
            This is a required field!
          </b-form-invalid-feedback>
        </b-form-group>


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
import { validationMixin } from "vuelidate";
import { required, numeric, integer, between } from 'vuelidate/lib/validators'


// custom validators
function smallerOrEqualThanPaymentCount(value) {
  return value <= this.form.PaymentCount
}

function divisibleByThree(value) {
  return !(value % 3)
}

function divisibleByThreeOrIsEqualToOne(value) {
  return divisibleByThree(value) || parseInt(value) === 1
}

function laterDateThanDrawFrom(value) {
  console.log("HELLO later")
  console.log(this.form.DrawFrom)
  return value > this.form.DrawFrom || !!!this.form.DrawFrom
}

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
        Debt: Number(this.$route.query.debt),
        InterestRatePrc: Number(this.$route.query.interest),
        PaymentCount: parseInt(this.$route.query.paymentCount),
        PaymentPeriod: parseInt(this.$route.query.paymentPeriod)
      },
      rows: [],
    }
  },
  validations: {
    form: {
      DrawFrom: {
        required
      },
      FirstDate: {
        required,
        laterDateThanDrawFrom
      },
      Debt: {
        required,
        numeric,
        between: between(0, 10000000000)
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
        between: between(6, 300)
      },
      PaymentPeriod: {
        required,
        integer,
        between: between(1, 300),
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
      const query = this.$route.query
      console.log("Hello!")
      console.log(query)
      if (!Object.keys(query).length) {
        return true
      }
      /*
      How can we do this?
      We can copy paste from data to here and init data with empty strings.
      I wonder how would that look like...

      It is important that we are giving the variables the same thing that the inputs are giving!
      Almost crucial.
       */
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
        row["PaidDate"] = new Date(row["PaidDate"]).toLocaleDateString('cs')
        row["Amount"] = formatter.format(row["Amount"])
        row["Interest"] = formatter.format(row["Interest"])
        row["Debt"] = formatter.format(row["Debt"])
        row["PaidAmount"] = formatter.format(row["PaidAmount"])
        row["Principal"] = formatter.format(row["Principal"])
        return row
      })

      return formatted
    }
  },
  beforeMount() {
    var isQueryEmpty = this.loadDataFromRouteQuery()
    if (isQueryEmpty) { // so the validator errors will not get triggered!
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
