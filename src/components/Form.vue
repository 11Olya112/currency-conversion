<template>
  <div class="hello">
    <h1 class="title">{{ msg }}</h1>
    <form>
      <h4>Конвертування валют</h4>
      <label for="fromCurrency">Вхідна валюта: </label>
      <select id="fromCurrency" v-model="fromCurrency">
        <option value="USD">USD</option>
      </select>
      <br /><br />
      <label for="toCurrency">Вихідна валюта: </label>
      <select id="toCurrency" v-model="toCurrency">
        <option
          v-bind:key="currency"
          v-for="currency in currencies"
          :value="currency"
        >
          {{ currency }}
        </option>
      </select>
      <br /><br />
      <label for="amount">Кількість бажаної валюти: </label>
      <input type="number" id="amount" v-model="amount" max="10000" min="0"/>
      <label for="text"> $</label>
      <br /><br />
      <div>
        <p>
          Результат: {{ amount }} {{ fromCurrency }} = {{ result }}
          {{ toCurrency }}
        </p>
      </div>
      <br />

    </form>
  </div>
</template>

<script>
//let result;
let result = 0;
//import money from 'money';
export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
  data() {
    return {
      amount: 0,
      fromCurrency: "USD",
      toCurrency: "BTC",
      currencies: [
        "USD",
        "BTC",
        "EUR",
        "UAH",
        "GBP",
        "BTC",
        "EUR",
      ],
      rates: null,
    };
  },
  computed: {
    result() {
      if (this.rates) {
        result =
          (this.amount / this.rates[this.fromCurrency]) *
          this.rates[this.toCurrency];
          return result;
      }
      return result;
    },
  },
  mounted() {
    this.fetchRates();
  },

  methods: {
    fetchRates() {
      const url = `https://openexchangerates.org/api/latest.json?app_id=7ecd5129702c4f00896f0738196fdfff`;
      fetch(url)
        .then((response) => response.json())
        .then((data) => {
          this.rates = data.rates;
        });
      console.log(this.rates);
    },
  },
};
</script>

<style scoped>

.title {
  position: relative;
  float: center;
}

.hello {
  text-align: left;
  margin-left: 50px;
}

h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
