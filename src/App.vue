<template>
  <div class="app">
    <div class="flex">
      <Form msg="Сurrency conversion" />
      <Block />
    </div>
  </div>
</template>

<script>
import Form from "./components/Form.vue";
import Block from "./components/Block.vue";

export default {
  name: "App",
  components: {
    Form,
    Block,
  },
  data() {
    return {
      showPopUp: false,
    };
  },
};
</script>

<style>
.flex {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

@media (min-width: 768px) {
  .flex {
    flex-direction: row;
  }
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  background-color: azure;
  max-width: 1024px;
  margin: 0 auto;
  height: 100vh;
}

.button {
  margin-top: 50px;
  padding: 10px;
  background-color: plum;
  border-color: plum;
}
</style>
