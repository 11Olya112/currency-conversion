<template>
  <div class="popup">
    <div class="popup-overlay" @click="$emit('close')"></div>

    <div class="popup-container">
      <div class="popup-header">
        <h2>Додавання валюти</h2>
        <button class="but" @click="$emit('close')">X</button>
      </div>

      <form @submit.prevent="onSubmit">
        <div class="popup-body">
          <label for="currency-name">Назва валюти: </label>
          <input
            id="currency-name"
            type="text"
            v-model="newCurrencyName"
            required
          />
          <label for="currency-code">Код валюти: </label>
          <input
            id="currency-code"
            type="text"
            v-model="newCurrencyCode"
            required
          />
        </div>
        <button type="submit" class="but">Додати</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      newCurrencyName: "",
      newCurrencyCode: "",
    };
  },
  methods: {
    onSubmit() {
      const newCurrency = {
        name: this.newCurrencyName,
        code: this.newCurrencyCode,
      };
      this.$emit("add", newCurrency);
      this.newCurrencyName = "";
      this.newCurrencyCode = "";
    },
  },
};
</script>

<style scoped>
.popup-body {
  display: flex;
  gap: 20px;
}

.but {
  margin-top: 20px;
}

.popup-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}
.popup {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.popup-overlay {
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
}

.popup-container {
  position: absolute;
  background-color: white;
  padding: 2rem;
  border-radius: 0.5rem;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
  text-align: center;
}

.popup-container h2 {
  margin-top: 0;
}
</style>
