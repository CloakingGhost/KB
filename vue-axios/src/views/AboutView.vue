<template>
  <div class="about">
    <h1>This is an about page</h1>
  </div>

  <button @click="testConn">누르시오-1</button>
  <div>{{ callMe1 }}</div>

  <button @click="testJson">누르시오-2</button>
  <div>{{ callMe2 }}</div>

  <button @click="testPost">누르시오-3</button>
  <div>{{ callMe3 }}</div>

  <button @click="testPostList">누르시오-4</button>
  <div v-for="(user, index) in callMe4" :key="index">
    <p>Name: {{ user.name }}</p>
    <p>Password: {{ user.password }}</p>
    <p>Age: {{ user.age }}</p>
    <p>City: {{ user.address.city }}</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
  ,
  data() {
    return {
      serverTime: '',
      callMe1: '',
      callMe2: '',
      callMe3: '',
      callMe4: [],
    };
  },
  methods: {
    async testConn() {
      try {
        const response = await axios.get('/api/conn');
        this.callMe1 = response.data;
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
    },
    async testJson() {
      try {
        const response = await axios.get('/api/testJson');
        this.callMe2 = response.data.name;
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
    },
    async testPost() {
      try {
        const data = {
          name: "클라이언트 이름",
          password: "qwer1234",
          age: 123,
          address: {
            city: "대전"
          }
        };
        const response = await axios.post('/api/joinWithConverter', data, {
          headers: {
            'Content-Type': 'application/json'
          }
        });
        this.callMe3 = response.data.password;
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
    },
    async testPostList() {
      try {
        const data = {
          id: 77,
          users: [
            {
              name: "클라이언트 이름1",
              password: "qwer1234",
              age: 123,
              address: {
                city: "대전"
              }
            },
            {
              name: "클라이언트 이름2",
              password: "qwer1234",
              age: 123,
              address: {
                city: "익산"
              }
            },
            {
              name: "클라이언트 이름3",
              password: "qwer1234",
              age: 123,
              address: {
                city: "춘전"
              }
            }
          ]
        };
        const response = await axios.post('/api/joinList', data, {
          headers: {
            'Content-Type': 'application/json'
          }
        });
        this.callMe4 = response.data;
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
    }
  },
};
</script>

<style scoped></style>