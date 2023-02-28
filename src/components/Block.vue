<template>
  <div class="block">
    <div>
      <label for="currency" class="label">Виберіть валюту: </label>
      <select
        id="currency"
        v-model="selectedCurrency"
        @change="updateCurrencies(selectedCurrency)"
      >
        <option value="USD">USD</option>
      </select>
    </div>
    <div class="currency-rates">
      <table>
        <thead>
          <tr v-for="currency in currencies" :key="currency.code">
            <td>{{ currency.name }}</td>
            <td>{{ currency.rate }}</td>
          </tr>
        </thead>
      </table>
    </div>
    <button @click="showAddCurrencyPopup">Додати валюту</button><br /><br />
    <button @click="updateCurrencies" :disabled="isUpdating">Оновити</button>
    <PopupWindow
      v-if="showPopup"
      @close="hideAddCurrencyPopup"
      @add="addNewCurrency"
    />
  </div>
</template>
<script>
import axios from "axios";
import PopupWindow from "./PopupWindow.vue";
export default {
  name: "HelloWorld",
  components: {
    PopupWindow,
  },
  data() {
    return {
      selectedCurrency: "USD",
      currencies: [
        { code: "USD", name: "USD:", rate: 0 },
        { code: "EUR", name: "EUR:", rate: 0 },
        { code: "UAH", name: "UAH:", rate: 0 },
        { code: "BTC", name: "BTC:", rate: 0 },
      ],
      showPopup: false,
      isUpdating: false,
    };
  },
  created() {
    this.updateCurrencies();
    setInterval(this.updateCurrencies, 5000);
  },
  mounted() {
    const savedCurrencies = localStorage.getItem("currencies");
    if (savedCurrencies) {
      this.currencies = JSON.parse(savedCurrencies);
    }
    this.updateCurrencies();
  },
  methods: {
    updateCurrencies() {
      if (!this.isUpdating) {
        this.isUpdating = true;
        const apiKey = "7ecd5129702c4f00896f0738196fdfff";
        const url = `https://openexchangerates.org/api/latest.json?app_id=${apiKey}&base=${this.selectedCurrency}`;

        axios
          .get(url)
          .then((response) => {
            this.currencies.forEach((currency) => {
              currency.rate = response.data.rates[currency.code];
            });
          })
          .catch((error) => {
            console.log(error);
            this.isUpdating = false;
          });
      }
    },

    showAddCurrencyPopup() {
      this.showPopup = true;
    },
    hideAddCurrencyPopup() {
      this.showPopup = false;
    },
    addNewCurrency(newCurrency) {
      this.currencies.push(newCurrency);
      localStorage.setItem("currencies", JSON.stringify(this.currencies));
      this.newCurrency = "";
      this.updateCurrencies();
      this.showPopup = false;
    },
  },
};
</script>

<style scoped>
.label {
  margin-bottom: 40px;
}

.input {
  width: 40px;
}

.block {
  text-align: left;
  margin: 90px 50px 0 50px;
}

.list {
  text-align: left;
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
