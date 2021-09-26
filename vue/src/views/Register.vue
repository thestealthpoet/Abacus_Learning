<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="emailAddress" class="sr-only">Email Address</label>
      <input
        type="text"
        id="emailAddress"
        class="form-control"
        placeholder="Email"
        v-model="user.emailAddress"
        required
        />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Ex: Pikachu1"
        pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
        v-model="user.password"
        
        required
      />
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <label for="name" class="sr-only">Full Name</label>
      <input
        type="text"
        id="name"
        class="form-control"
        placeholder="Name"
        v-model="user.name"
        required
        />
      <router-link :to="{ name: 'login' }">Have an account?</router-link>
      <button id="btn" class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        name: '',
        emailAddress: '',
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user'
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
.form-register {
  /* justify-content: flex-start; */
  display: flex;
  align-items: center;
  flex-direction: column;
  border: 3px solid #219EBC;
  border-radius: 3px;
  display: inline-flex;
  padding: 40px;
  background: rgb(245, 245, 245);
  margin: 80px;
}

.logo {
  justify-content: flex-start;
}

#crt-btn {
  background-color: rgba(251, 172, 14, .7);
}


</style>
