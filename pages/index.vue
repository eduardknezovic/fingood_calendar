<template>
  <section class="container">

    <h1>
      FinGood calendar
    </h1>

    <div class="no-print">
      <CalendarInput></CalendarInput>
    </div>

    <CalendarTable></CalendarTable>

  </section>
</template>

<script>
import CalendarInput from '~/components/CalendarInput.vue'
import CalendarTable from '~/components/CalendarTable.vue'

export default {
  components: {
    CalendarInput,
    CalendarTable
  }
}
</script>

<style>

  @media print {

    @page {
      size: auto;   /* auto is the initial value */
      margin: 0;  /* this affects the margin in the printer settings */
    }
    .no-print, .no-print *
    {
      display: none !important;
    }
  }

</style>
